Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2 1/1] rpmsg: virtio_rpmsg_bus: fix channel creation
References: <1481813396-1529-1-git-send-email-loic.pallardy@st.com>
 <20161216050912.GS3439@tuxbot>
From: Suman Anna <s-anna@ti.com>
Message-ID: <a5c97c71-a78f-25a7-c2ee-cfb236825997@ti.com>
Date: Tue, 27 Dec 2016 16:36:32 -0600
MIME-Version: 1.0
In-Reply-To: <20161216050912.GS3439@tuxbot>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic,

On 12/15/2016 11:09 PM, Bjorn Andersson wrote:
> On Thu 15 Dec 06:49 PST 2016, Loic Pallardy wrote:
> 
>> Since commit 4dffed5b3ac796b ("rpmsg: Name rpmsg devices based on
>> channel id"), it is no more possible for a firmware to register twice
>> a service (on different endpoints). rpmsg_register_device function
>> is failing when calling device_add for the second time as second
>> device has the same name as first one already register.
>> It is because name is based only on service name and so is not more
>> unique. Previously name was unique thanks to the use of rpmsg_dev_index.
>>
>> This patch adds destination and source endpoint numbers device name to
>> create an unique identifier.
>>
>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> 
> Looks good, thanks.

Thanks for the patch, I have ran into the exact same issue as well.

> 
> Regards,
> Bjorn
> 
>> ---
>> v2: Update commit header with commit ID generating regression
>> Fix rpmsg_core instead of virtio_rpmsg
>>
>>  drivers/rpmsg/rpmsg_core.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index a79cb5a..18c73e0 100644
>> --- a/drivers/rpmsg/rpmsg_core.c
>> +++ b/drivers/rpmsg/rpmsg_core.c
>> @@ -453,8 +453,8 @@ int rpmsg_register_device(struct rpmsg_device *rpdev)
>>  	struct device *dev = &rpdev->dev;
>>  	int ret;
>>  
>> -	dev_set_name(&rpdev->dev, "%s:%s",
>> -		     dev_name(dev->parent), rpdev->id.name);
>> +	dev_set_name(&rpdev->dev, "%s.%d.%d.%s", dev_name(dev->parent),
>> +		     rpdev->src, rpdev->dst, rpdev->id.name);

This is fine, though I would have preferred the numbers at the end after
the string literals (%s.%s.%d.%d instead of %s.%d.%d.%s)

regards
Suman

>>  
>>  	rpdev->dev.bus = &rpmsg_bus;
>>  	rpdev->dev.release = rpmsg_release_device;
>> -- 
>> 1.9.1
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remoteproc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
