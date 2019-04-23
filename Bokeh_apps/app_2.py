import pandas as pd

from bokeh.layouts import row, column
from bokeh.models import Select
from bokeh.palettes import Spectral5
from bokeh.plotting import curdoc, figure

cars = pd.read_csv('data/auto-mpg.csv')
cars['horsepower'] = pd.to_numeric(cars['horsepower'], errors='coerce')
cars = cars.dropna(axis='rows')
countries = pd.DataFrame({'origin':[1,2,3],
                          'country': ['USA', 'Europe', 'Japan']})
cars = cars.merge(countries, on='origin')
cars = cars.drop('origin', axis='columns')

countries = list(cars.country.unique())


def create_figure():
    cars_s = cars[cars.country == x.value]
    
    p = figure(plot_height=600, plot_width=800, tools='pan,box_zoom,hover,reset')
    p.xaxis.axis_label = 'fe'
    p.yaxis.axis_label = 'dfvd'
    p.circle(x='horsepower', y='mpg', source=cars_s, line_color="white", size = 8, 
             fill_alpha=0.5, hover_color='white', hover_alpha=0.5)    
    return p


def update(attr, old, new):
    layout.children[1] = create_figure()


x = Select(title='Country', value='country', options=countries)
x.on_change('value', update)

controls = column([x])
layout = row(controls, create_figure())

curdoc().add_root(layout)
curdoc().title = "Crossfilter"