Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH] rpmsg: Release rpmsg devices in backends
References: <4955fa27-2daf-b80f-c37f-35489c63b599@ginzinger.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <e6bdf431-8950-8543-cec0-bbf9c9a270c2@ti.com>
Date: Fri, 2 Jun 2017 19:28:57 -0500
MIME-Version: 1.0
In-Reply-To: <4955fa27-2daf-b80f-c37f-35489c63b599@ginzinger.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Henri Roosen <henri.roosen@ginzinger.com>, bjorn.andersson@linaro.org
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 06/02/2017 05:07 AM, Henri Roosen wrote:
>> The rpmsg devices are allocated in the backends and as such must be
>> freed there as well.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>  drivers/rpmsg/qcom_smd.c         | 11 +++++++++++
>>  drivers/rpmsg/virtio_rpmsg_bus.c |  9 +++++++++
>>  2 files changed, 20 insertions(+)
>>
>> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
>> index beaef5dd973e..a0a39a8821a3 100644
>> --- a/drivers/rpmsg/qcom_smd.c
>> +++ b/drivers/rpmsg/qcom_smd.c
>> @@ -969,6 +969,14 @@ static const struct rpmsg_endpoint_ops
>> qcom_smd_endpoint_ops = {
>>      .poll = qcom_smd_poll,
>>  };
>>
>> +static void qcom_smd_release_device(struct device *dev)
>> +{
>> +    struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>> +    struct qcom_smd_device *qsdev = to_smd_device(rpdev);
>> +
>> +    kfree(qsdev);
>> +}
>> +
>>  /*
>>   * Create a smd client device for channel that is being opened.
>>   */
>> @@ -998,6 +1006,7 @@ static int qcom_smd_create_device(struct
>> qcom_smd_channel *channel)
>>
>>      rpdev->dev.of_node = qcom_smd_match_channel(edge->of_node,
>> channel->name);
>>      rpdev->dev.parent = &edge->dev;
>> +    rpdev->dev.release = qcom_smd_release_device;
>>
>>      return rpmsg_register_device(rpdev);
> 
> This will not work: the registration of qcom_smd_release_device at
> rpdev->dev.release gets overwritten inside rpmsg_register_device() and
> will then point to the function rpmsg_release_device().
> 
> My suggestion would be to additionally change/fix
> rpmsg_register_device() so it will not overwrite the release callback.
> 
>>  }
>> @@ -1013,6 +1022,8 @@ static int qcom_smd_create_chrdev(struct
>> qcom_smd_edge *edge)
>>      qsdev->edge = edge;
>>      qsdev->rpdev.ops = &qcom_smd_device_ops;
>>      qsdev->rpdev.dev.parent = &edge->dev;
>> +    qsdev->rpdev.dev.release = qcom_smd_release_device;
>> +
>>      return rpmsg_chrdev_register_device(&qsdev->rpdev);
> 
> This will not work either: same reason as described above because
> rpmsg_chrdev_register_device() will call rpmsg_register_device().
> 
>>  }
>>
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c
>> b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index 5e66e081027e..7f8c5cc1c118 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -360,6 +360,14 @@ static const struct rpmsg_device_ops
>> virtio_rpmsg_ops = {
>>      .announce_destroy = virtio_rpmsg_announce_destroy,
>>  };
>>
>> +static void virtio_rpmsg_release_device(struct device *dev)
>> +{
>> +    struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>> +    struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>> +
>> +    kfree(vch);
>> +}
>> +
>>  /*
>>   * create an rpmsg channel using its name and address info.
>>   * this function will be used to create both static and dynamic
>> @@ -408,6 +416,7 @@ static struct rpmsg_device
>> *rpmsg_create_channel(struct virtproc_info *vrp,
>>      strncpy(rpdev->id.name, chinfo->name, RPMSG_NAME_SIZE);
>>
>>      rpdev->dev.parent = &vrp->vdev->dev;
>> +    rpdev->dev.release = virtio_rpmsg_release_device;
>>      ret = rpmsg_register_device(rpdev);
> 
> The same issue as described above.

FWIW, I didn't run into any rpmsg device memory leaks even without this
patch with booting and shutting down of remoteproc devices. The
virtio_rpmsg_channel structure inherits the struct rpmsg_device and is
the one that gets allocated, and the release function plugged in
rpmsg_release_device is operating on the rpmsg_device pointer, but both
are actually the same pointer.

Did you run into any memory leaks that required you to have this patch?

regards
Suman
