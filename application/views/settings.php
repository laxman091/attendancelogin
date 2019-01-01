<div class="container">
<div class="row">
    <div class="col-md-4 col-lg-4 col-lg-offset-2">
        <h2>Settings</h2>
        <h5>Hello <span><?php echo $first_name; ?></span>.</h5>
        <hr>
        <?php
        $fattr = array('class' => 'form-signin');
        echo form_open(site_url().'main/settings/', $fattr);

        function tz_list() {
            $zones_array = array();
            $timestamp = time();
            foreach(timezone_identifiers_list() as $key => $zone) {
              date_default_timezone_set($zone);
              $zones_array[$key]['zone'] = $zone;
            }
            return $zones_array;
        }
        ?>

        <?php echo '<input type="hidden" name="id" value="'.$id.'">'; ?>
        <div class="form-group">
        <span>Start Time</span>
          <?php echo form_input(array('name'=>'start_time', 'id'=> 'start_time', 'placeholder'=>'Start', 'class'=>'form-control', 'value' => set_value('start_time', $start))); ?>
          <?php echo form_error('start_time');?>
        </div>
        <div class="form-group">
        <span>Out Time</span>
          <?php echo form_input(array('name'=>'out_time', 'id'=> 'out_time', 'placeholder'=>'Out', 'class'=>'form-control', 'value'=> set_value('out_time', $out))); ?>
          <?php echo form_error('out_time');?>
        </div>
        <div class="form-group">
        <span>How Many Employee</span>
          <?php echo form_input(array('name'=>'many_employee', 'id'=> 'many_employee', 'placeholder'=>'How many employee', 'class'=>'form-control', 'value'=> set_value('many_employee', $many_employee))); ?>
          <?php echo form_error('many_employee');?>
        </div>
        <div class="form-group">
        <span>Key</span>
          <?php echo form_input(array('name'=>'key', 'id'=> 'key', 'placeholder'=>'KEY', 'class'=>'form-control', 'value' => set_value('key', $key))); ?>
          <?php echo form_error('key') ?>
        </div>
        <span>Recaptcha</span>
        <select name="recaptcha" id="recaptcha" class="form-control">
          <?php
          if($recaptcha == 0){
            echo '
            <option value="0" selected>No</option>
            <option value="1">Yes</option>
            ';
          }else{
            echo '
            <option value="0">No</option>
            <option value="1" selected>Yes</option>
            ';
          }
          ?>
        </select>
        <span>Timezone</span>
        <select name="timezone" id="timezone" class="form-control">
                <option value="<?php echo $timezonevalue; ?>"><?php echo $timezone; ?></option>
          <?php foreach(tz_list() as $t) { ?>
              <option value="<?php echo $t['zone']; ?>"> <?php echo $t['zone']; ?></option>
          <?php } ?>
        </select>
          <?php echo form_submit(array('value'=>'Save', 'name'=>'submit', 'class'=>'btn btn-primary btn-block', 'style' => 'margin-right:10px')); ?>
          <?php echo form_close(); ?>
          <button onclick="myFunction()" class="btn btn-default btn-block" style="margin-top: 10px">Get New Key</button>
    </div>
    <div class="col-md-4 col-lg-4">
        <h2>Share The Key</h2>
        <br>
        <hr>
        <?php
        function generateRandomString() {
            $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $charactersLength = strlen($characters);
            $randomString = sha1($characters[rand(0, $charactersLength - 1)]);
            return $randomString;
        }

        echo '<div class="alert alert-info" role="alert">Share the KEY via:</div>';
        echo '<a href="whatsapp://send?text='.$key.'" data-action="share/whatsapp/share"><i class="fa fa-whatsapp" aria-hidden="true"></i></a> ';
        echo '<a href="mailto:?subject=Share KEY&amp;body=The Key is: '.$key.'" title="Share KEY"><i class="fa fa-envelope-o" aria-hidden="true"></i></a> ';
        echo '<a class="copy-text" data-clipboard-target="#key" href="#"><i class="fa fa-clipboard" aria-hidden="true"></i></a>';
        ?>
        <script>
        function myFunction() {
            document.getElementById("key").value = "<?php echo generateRandomString(); ?>";
        }
        </script>
    </div>
</div>
</div>
