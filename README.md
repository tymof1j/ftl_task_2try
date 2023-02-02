# README

# Faster Than Light task

## Used technologies:

### Backend part:
- `esbuild`
- ruby '3.2.0'
- gems rails, pg, rspec-rails, shoulda-matchers, factory_bot_rails, faker, pry, devise

### Frontend part:
- CSS - [tailwindCss](https://tailwindcss.com)

## How to run project:
1. Clone the repo:
```shell
git clone git@github.com:tymof1j/ftl_task_2try.git
```
2. Install gems:
```shell
bundle install
```
3. Create and migrate database:
```shell
rails db:create
rails db:migrate
```
4. Because I used `esbuild` in this project in order to run it you have to use command:
```shell
./bin/dev
```

### Test coverage:
![](./pics/10_test_coverage.png)

### Structure of db:
![](./pics/screenshot.png)
- Amount, name, category are required fields for spendings table
- Description is optional

### Pictures from website:
  - Creation of spending.
![](./pics/1_creating_spending.png)
  - Viewing all entries.
![](./pics/2_all_entries.png)
  - Viewing filtered entries.
![](./pics/3_filtered_entries.png)
  - Viewing sharing page.
![](./pics/4_sharing_page.png)
  - Viewing show action of shared_list.
![](./pics/5_show_shared_list.png)
  - Sharing you spending list with someone.
![](./pics/6_new_shared_list.png)
