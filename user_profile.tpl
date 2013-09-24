{{extends file="layout.tpl"}}

{{block content}}

<h3>

<!--{{ $user->uname }}
<ul class="links">
    {{ if $user->logged_in }}
    <li><a href="{{ $view->url(['controller' => 'dashboard', 'action' => 'index'], 'default') }}">{{ #editProfile# }}</a></li>
    {{ /if }}
</ul>-->
{{ if $user->isAuthor() }}
  {{ #editorProfile# }}
{{ else }}
  {{ #userProfile# }}
{{ /if }}
</h3>

{{ if $user->isAuthor() }}

<div class="user-profile-data twelvecol">

<figure class="user-image threecol">
  <img src="{{ include file="_tpl/user-image.tpl" user=$user width=156 height=156 }}" />
</figure>

<div class="user-profile-data editor ninecol last">
  <h5>{{ $user->first_name }} {{ $user->last_name }}<i>{{ $user->uname }}</i>
    <ul class="links">
    {{ if $user->logged_in }}
    <li><a href="{{ $view->url(['controller' => 'dashboard', 'action' => 'index'], 'default') }}">{{ #editProfile# }}</a></li>
    {{ /if }}
</ul>
    </h5>
  <p class="date">member from {{ $user->created }}<span class="posts">{{ #numberOfPosts# }} {{ $user->posts_count }}</span></p>
    
    <div class="user-profile-posts">
      {{ include file="_tpl/user-content.tpl" user=$user }}
    </div>
</div>

<!--<div class="user-profile-posts twelvecol">
{{ include file="_tpl/user-content.tpl" user=$user }}
</div>-->
</div>

{{ else }}

<div class="user-profile-data twelvecol">

<figure class="user-image threecol">
  <img src="{{ include file="_tpl/user-image.tpl" user=$user width=156 height=156 }}" />
</figure>

<div class="user-profile-data ninecol last">
<h5>{{ $user->first_name }} {{ $user->last_name }}<i>{{ $user->uname }}</i>
    <ul class="links">
        {{ if $user->logged_in }}
        <li><a href="{{ $view->url(['controller' => 'dashboard', 'action' => 'index'], 'default') }}">{{ #editProfile# }}</a></li>
        {{ /if }}
    </ul>
</h5>
<p class="date">member from {{ $user->created }}<span class="posts">{{ #numberOfPosts# }} {{ $user->posts_count }}</span></p>

<dl class="profile">
    <dd>{{ $profile['bio'] }}</dd>
    <dd><b>{{ #birthday# }}:</b> {{ $profile['birth_date'] }}</dd>
 	 <dd><b>{{ #gender# }}:</b> {{ $profile['gender'] }}</dd>
    <dd><b>{{ #organisation# }}:</b> {{ $profile['organisation']}}</dd>
    <dd><b>{{ #website# }}:</b> <a class="link-color" href="{{ $profile['website']}}" target="_blank" rel="nofollow">{{ $profile['website']|escape}}</a></dd>
</dl>

</div>
</div>

{{ /if }}

{{/block}}
