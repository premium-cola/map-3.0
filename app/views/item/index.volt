
{{ content() }}

<div align="right">
    {{ link_to("item/new", "Create item") }}
</div>

{{ form("item/search", "method":"post", "autocomplete" : "off") }}

<div align="center">
    <h1>Search item</h1>
</div>

<table>
    <tr>
        <td align="right">
            <label for="id">Id</label>
        </td>
        <td align="left">
            {{ text_field("id", "type" : "numeric") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="collmex_customer_id">Collmex Of Customer</label>
        </td>
        <td align="left">
            {{ text_field("collmex_customer_id", "type" : "numeric") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="name">Name</label>
        </td>
        <td align="left">
            {{ text_field("name", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="street">Street</label>
        </td>
        <td align="left">
            {{ text_field("street", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="street_number">Street Of Number</label>
        </td>
        <td align="left">
            {{ text_field("street_number", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="zip">Zip</label>
        </td>
        <td align="left">
            {{ text_field("zip", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="city">City</label>
        </td>
        <td align="left">
            {{ text_field("city", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="country">Country</label>
        </td>
        <td align="left">
            {{ text_field("country", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="lat">Lat</label>
        </td>
        <td align="left">
            {{ text_field("lat", "type" : "numeric") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="lng">Lng</label>
        </td>
        <td align="left">
            {{ text_field("lng", "type" : "numeric") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="web">Web</label>
        </td>
        <td align="left">
            {{ text_field("web", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="email">Email</label>
        </td>
        <td align="left">
            {{ text_field("email", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="location_checked">Location Of Checked</label>
        </td>
        <td align="left">
            {{ text_field("location_checked", "type" : "numeric") }}
        </td>
    </tr>

    <tr>
        <td></td>
        <td>{{ submit_button("Search") }}</td>
    </tr>
</table>

</form>