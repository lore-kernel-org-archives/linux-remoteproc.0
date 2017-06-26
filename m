Return-Path: <Henri.Roosen@ginzinger.com>
Subject: Re: [PATCH] rpmsg: rpmsg_core: fix null-ptr dereference for devices
 without ops
References: <1496403321-32234-1-git-send-email-henri.roosen@ginzinger.com>
 <20170625215148.GJ26155@builder>
From: Henri Roosen <henri.roosen@ginzinger.com>
Message-ID: <75ec91fa-270b-862a-6e7e-15839dff3fc8@ginzinger.com>
Date: Mon, 26 Jun 2017 11:04:40 +0200
MIME-Version: 1.0
In-Reply-To: <20170625215148.GJ26155@builder>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On 06/25/2017 11:51 PM, Bjorn Andersson wrote:
> On Fri 02 Jun 04:35 PDT 2017, Henri Roosen wrote:
>
>> A device might not have an ops structure registered. This
>> patch fixes a null-prt dereference by checking ops before dereferencing
>> it.
>>
>
> In what scenario do you end up with a rpdev without ops defined?
>
> You need at least create_ept defined in your ops to be able to do any
> form of communication. So it would probably make more sense to add a
> sanity check in rpmsg_register_device(), but perhaps I'm missing
> something.

I was trying to add support for the generic rpmsg-char driver for
virtio_rpmsg_bus.

The rpmsg-char driver gets registered using 
rpmsg_chrdev_register_device(), and IMHO this device should not have any
.ops. The chrdev is not used for communication, only for creating 
devices. The devices which should have the .ops are the ones created 
using the rpmsg-char device.

So actually having .ops for the device passed to 
rpmsg_chrdev_register_device() in drivers/rpmsg/qcom_smd.c seems wrong 
to me too and should be cleaned up.

>
>
> (If this is not true there are a bunch of other places where this needs
> to be checked as well)

If you agree to my opinion above, then I think this comes down to a 
design decision: a possibility might be to split off the chrdev code to 
a different implementation as the code for the communication devices. 
Else we need to identify the other places for the check.

Best regards,
Henri

>
> Regards,
> Bjorn
>
>> Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
>> ---
>>  drivers/rpmsg/rpmsg_core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index 600f5f9..0c48452 100644
>> --- a/drivers/rpmsg/rpmsg_core.c
>> +++ b/drivers/rpmsg/rpmsg_core.c
>> @@ -429,7 +429,7 @@ static int rpmsg_dev_probe(struct device *dev)
>>  		goto out;
>>  	}
>>
>> -	if (rpdev->ops->announce_create)
>> +	if (rpdev->ops && rpdev->ops->announce_create)
>>  		err = rpdev->ops->announce_create(rpdev);
>>  out:
>>  	return err;
>> --
>> 2.1.4
>>
