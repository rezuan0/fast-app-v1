from fastapi import FastAPI, Request, Form
from fastapi.templating import Jinja2Templates
from database import search_movies_by_year, upload_movie_data
import uvicorn

app = FastAPI()
templates = Jinja2Templates(directory="templates")


@app.get("/")
def home(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})


@app.post("/")
def search_movies(request: Request, year_of_release: int = Form(...)):
    results = search_movies_by_year(year_of_release)
    # results = ""
    return templates.TemplateResponse("index.html", {"request": request, "results": results})


@app.get("/upload_data")
def upload_data(request: Request):
    return templates.TemplateResponse("upload_data.html", {"request": request})


@app.post("/upload_data")
def upload_movie_data_handler(
        request: Request,
        movie_name: str = Form(...),
        year_of_release: int = Form(...),
        box_office: float = Form(...),
        director: str = Form(...),
        producer: str = Form(...),
        cast: str = Form(...)
):
    upload_movie_data(movie_name, year_of_release, box_office, director, producer, cast)
    return templates.TemplateResponse("upload_data.html", {"request": request})


# Run the app
if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
