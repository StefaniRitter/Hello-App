from fastapi import FastAPI 

app = FastAPI() 
@app.get("/") 
async def root(): 
    return {"message": "Imagem atualizada! O projeto foi concluído com sucesso!🎯🎉"} 