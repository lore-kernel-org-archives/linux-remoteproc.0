Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus: fix channel creation
References: <1480096493-7142-1-git-send-email-loic.pallardy@st.com>
 <20161202231944.GF9322@tuxbot>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <2d614108-75ff-f6e8-8776-c6b2f6bbc629@st.com>
Date: Mon, 5 Dec 2016 09:32:38 +0100
MIME-Version: 1.0
In-Reply-To: <20161202231944.GF9322@tuxbot>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>



On 12/03/2016 12:19 AM, Bjorn Andersson wrote:
> On Fri 25 Nov 09:54 PST 2016, Loic Pallardy wrote:
>
>> Since virtio backend creation, it is no more possible for a firmware to
>> register twice a service (on different endpoints). rpmsg_register_device
>> function is failing when calling device_add for the second time as second
>> device has the same name as first one already register.
>> It is because name is based only on service name.
>>
>
> Afaict rpmsg_create_channel() first looks for any existing devices with
> the same src, dst and name and if such device is found we fail early and
> this logic is found before all those changes as well.
>
>> This patch adds destination endpoint to service name to create an
>> unique device name.
>
> As the code didn't look to support multiple services with the same name
> I have not considered this scenario. Can you describe your use case for
> this?
>
Services are generic and could be instancied several times.
For exemple we have some communication coprocessor (modem like) for 
which we are using 2 socket channels between coprocessor and user space 
stack.
Today each rpmsg client driver is identified by a unique service name. 
"rpmsg-proto" for socket channel for example.
User space application can open a specified socket providing endpoint 
number or request for a socket creation thanks to bind.

Ditto with tty, with one tty for command and one tty for debug (reuse of 
external coprocessor SW)

Also I have similar issue with some I2C or SPI over rpmsg driver which 
allow host to access coprocessor peripherals (mostly in development or 
debug mode).

I think use cases are multiple and rpmsg should not limit the number of 
identical services.

Regards,
Loic
>>
>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>> ---
>>  drivers/rpmsg/virtio_rpmsg_bus.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index 3090b0d..dce880f 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -405,7 +405,8 @@ static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
>>  	 */
>>  	rpdev->announce = rpdev->src != RPMSG_ADDR_ANY;
>>
>> -	strncpy(rpdev->id.name, chinfo->name, RPMSG_NAME_SIZE);
>> +	snprintf(rpdev->id.name, RPMSG_NAME_SIZE, "%s-%d", chinfo->name,
>> +		 chinfo->dst);
>>
>
> But in rpmsg_id_match() we match rpdev->id.name against the id_table of
> the registered drivers to find out which driver to probe, please help me
> understand what I'm missing here.
>
> Regards,
> Bjorn
>
