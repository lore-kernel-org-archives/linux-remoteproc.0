Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v2 1/2] rpmsg: core: add possibility to get message
 payload length
References: <1557500577-22366-1-git-send-email-arnaud.pouliquen@st.com>
 <1557500577-22366-2-git-send-email-arnaud.pouliquen@st.com>
 <20190701053137.GC1263@builder>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <47f4ade7-1f9a-664e-1b6e-3c9f16df55d0@st.com>
Date: Tue, 2 Jul 2019 16:48:08 +0200
MIME-Version: 1.0
In-Reply-To: <20190701053137.GC1263@builder>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, xiang xiao <xiaoxiang781216@gmail.com>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Fabien DESSENNE <fabien.dessenne@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>



On 7/1/19 7:31 AM, Bjorn Andersson wrote:
> On Fri 10 May 08:02 PDT 2019, Arnaud Pouliquen wrote:
> 
>> Return the rpmsg buffer payload size for sending message, so rpmsg users
>> can split a long message in several sub rpmsg buffers.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> 
> This should list each person who dealt with the patch. So the first
> would be the author and the last would be the one that posted it on the
> list.
> 
> If you both authored the patch then you should add Co-developed-by to
> denote this.
ok i will update it
> 
>> ---
>>  drivers/rpmsg/rpmsg_core.c       | 20 ++++++++++++++++++++
>>  drivers/rpmsg/rpmsg_internal.h   |  2 ++
>>  drivers/rpmsg/virtio_rpmsg_bus.c | 11 +++++++++++
>>  include/linux/rpmsg.h            | 10 ++++++++++
>>  4 files changed, 43 insertions(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index 8122807db380..75c8c403ffe5 100644
>> --- a/drivers/rpmsg/rpmsg_core.c
>> +++ b/drivers/rpmsg/rpmsg_core.c
>> @@ -283,6 +283,26 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>  }
>>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>>  
>> +/**
>> + * rpmsg_get_buf_payload_size()
>> + * This function returns buffer payload size available for sending messages.
>> + *
>> + * @ept: the rpmsg endpoint
>> + *
>> + * Returns buffer payload size on success and an appropriate error value on
>> + * failure.
>> + */
> 
> Please read
> https://www.kernel.org/doc/Documentation/kernel-doc-nano-HOWTO.txt
oops sorry for this dirty documentation.
> 
>> +int rpmsg_get_buf_payload_size(struct rpmsg_endpoint *ept)
> 
> payload size can have many meanings and hopefully we'll end up in a
> situation where its dynamic. But it could be considered useful to have a
> way to query the maximum transmission size in such a setup.
> 
> So please rename this rpmsg_get_mtu() or something similar.
> 
> And I would prefer ssize_t as return type.

ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept) sounds good, ok for this
>> +{
>> +	if (WARN_ON(!ept))
>> +		return -EINVAL;
>> +	if (!ept->ops->get_buf_payload_size)
>> +		return -ENXIO;
>> +
>> +	return ept->ops->get_buf_payload_size(ept);
>> +}
>> +EXPORT_SYMBOL(rpmsg_get_buf_payload_size);
>> +
>>  /*
>>   * match an rpmsg channel with a channel info struct.
>>   * this is used to make sure we're not creating rpmsg devices for channels
>> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
>> index 0d791c30b7ea..6f733a556139 100644
>> --- a/drivers/rpmsg/rpmsg_internal.h
>> +++ b/drivers/rpmsg/rpmsg_internal.h
>> @@ -46,6 +46,7 @@ struct rpmsg_device_ops {
>>   * @trysend:		see @rpmsg_trysend(), required
>>   * @trysendto:		see @rpmsg_trysendto(), optional
>>   * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
>> + * @get_buf_payload_size: see @rpmsg_get_buf_payload_size(), optional
>>   *
>>   * Indirection table for the operations that a rpmsg backend should implement.
>>   * In addition to @destroy_ept, the backend must at least implement @send and
>> @@ -65,6 +66,7 @@ struct rpmsg_endpoint_ops {
>>  			     void *data, int len);
>>  	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
>>  			     poll_table *wait);
>> +	int (*get_buf_payload_size)(struct rpmsg_endpoint *ept);
>>  };
>>  
>>  int rpmsg_register_device(struct rpmsg_device *rpdev);
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index 5d3685bd76a2..82753e76e377 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -175,6 +175,7 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
>>  				  int len, u32 dst);
>>  static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
>>  					   u32 dst, void *data, int len);
>> +static int virtio_get_buf_payload_size(struct rpmsg_endpoint *ept);
>>  
>>  static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
>>  	.destroy_ept = virtio_rpmsg_destroy_ept,
>> @@ -184,6 +185,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
>>  	.trysend = virtio_rpmsg_trysend,
>>  	.trysendto = virtio_rpmsg_trysendto,
>>  	.trysend_offchannel = virtio_rpmsg_trysend_offchannel,
>> +	.get_buf_payload_size = virtio_get_buf_payload_size,
>>  };
>>  
>>  /**
>> @@ -699,6 +701,15 @@ static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
>>  	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
>>  }
>>  
>> +static int virtio_get_buf_payload_size(struct rpmsg_endpoint *ept)
>> +{
>> +	struct rpmsg_device *rpdev = ept->rpdev;
>> +	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>> +	int size = vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>> +
>> +	return size < 0 ? -EMSGSIZE : size;
> 
> Seems that a rpmsg instance configured to not even have space for the
> rpmsg_hdr in each message is rather broken. Shouldn't this be prohibited
> elsewhere?
yes seems that the are some useless check in code on buf_size, i will
suppress the check here.
there are some other instances in code...For time being the size is
fixed, but good place seems to be in the rpmsg_probe probe function. i
will propose a patch to clean this.

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
>> +}
>> +
>>  static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>>  			     struct rpmsg_hdr *msg, unsigned int len)
>>  {
>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
>> index 9fe156d1c018..250df2165086 100644
>> --- a/include/linux/rpmsg.h
>> +++ b/include/linux/rpmsg.h
>> @@ -135,6 +135,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>>  			poll_table *wait);
>>  
>> +int rpmsg_get_buf_payload_size(struct rpmsg_endpoint *ept);
>> +
>>  #else
>>  
>>  static inline int register_rpmsg_device(struct rpmsg_device *dev)
>> @@ -242,6 +244,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>>  	return 0;
>>  }
>>  
>> +static int rpmsg_get_buf_payload_size(struct rpmsg_endpoint *ept)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return -ENXIO;
>> +}
>> +
>>  #endif /* IS_ENABLED(CONFIG_RPMSG) */
>>  
>>  /* use a macro to avoid include chaining to get THIS_MODULE */
>> -- 
>> 2.7.4
>>
