Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH] rpmsg: virtio_rpmsg_bus: replace "%p" with "%pK"
References: <20181024011909.21674-1-s-anna@ti.com>
 <1cc3d697-6fde-901b-2e35-2e2b53b44425@ti.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <2ef5e274-df09-c3a0-41ed-a945d1902eaf@ti.com>
Date: Mon, 12 Aug 2019 11:28:27 -0500
MIME-Version: 1.0
In-Reply-To: <1cc3d697-6fde-901b-2e35-2e2b53b44425@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Andrew F. Davis" <afd@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 8/12/19 10:47 AM, Andrew F. Davis wrote:
> On 10/23/18 9:19 PM, Suman Anna wrote:
>> The virtio_rpmsg_bus driver uses the "%p" format-specifier for
>> printing the vring buffer address. This prints only a hashed
>> pointer even for previliged users. Use "%pK" instead so that
>> the address can be printed during debug using kptr_restrict
>> sysctl.
>>
> 
> 
> s/previliged/privileged

Bjorn,
Can you fix this up when applying.

> 
> You describe what the code does, but not why you need this. %pK is used
> for only about 1% of pointer printing, why do you want to leak this
> address to userspace at all?

Andrew,
Default behavior of %pK is same as %p, but it does allow you to control
the print. The reason is clearly mentioned in the last sentence in the
patch description.

regards
Suman

> 
> Andrew
> 
> 
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index f29dee731026..1345f373a1a0 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -950,7 +950,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>  		goto vqs_del;
>>  	}
>>  
>> -	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
>> +	dev_dbg(&vdev->dev, "buffers: va %pK, dma %pad\n",
>>  		bufs_va, &vrp->bufs_dma);
>>  
>>  	/* half of the buffers is dedicated for RX */
>>
