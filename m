Return-Path: <Matt.Redfearn@imgtec.com>
Subject: Re: [PATCH 1/4] remoteproc: Use fixed length field for firmware name
References: <1476193185-32107-1-git-send-email-matt.redfearn@imgtec.com>
 <1476193185-32107-2-git-send-email-matt.redfearn@imgtec.com>
 <228941a5-ea67-8875-ddb4-93622ebb1760@st.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <e234dae6-0cbd-d4cd-2aca-b1f24824a308@imgtec.com>
Date: Thu, 13 Oct 2016 15:18:43 +0100
MIME-Version: 1.0
In-Reply-To: <228941a5-ea67-8875-ddb4-93622ebb1760@st.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: loic pallardy <loic.pallardy@st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic,


On 13/10/16 14:22, loic pallardy wrote:
>
>
> On 10/11/2016 03:39 PM, Matt Redfearn wrote:
>> Storage of the firmware name was inconsistent, either storing a pointer
>> to a name stored with unknown ownership, or a variable length tacked
>> onto the end of the struct proc allocated in rproc_alloc.
>>
>> In preparation for allowing the firmware of an already allocated struct
>> rproc to be changed, the easiest way to allow reallocation of the name
>> is to switch to a fixed length buffer held as part of the struct rproc.
>> That way we can either copy the provided firmware name into it, or print
>> into it based on a name template. A new function,
>> rproc_set_firmware_name() is introduced for this purpose, and that logic
>> removed from rproc_alloc().
>>
>> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
>> ---
>>
>>  drivers/remoteproc/remoteproc_core.c | 64 
>> +++++++++++++++++++++++-------------
>>  include/linux/remoteproc.h           |  4 ++-
>>  2 files changed, 45 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c 
>> b/drivers/remoteproc/remoteproc_core.c
>> index fe0539ed9cb5..48cd9d5afb69 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1309,6 +1309,42 @@ static void rproc_type_release(struct device 
>> *dev)
>>      kfree(rproc);
>>  }
>>
>> +/**
>> + * rproc_set_firmware_name() - helper to create a valid firmare name
>> + * @rproc: remote processor
>> + * @firmware: name of firmware file, can be NULL
>> + *
>> + * If the caller didn't pass in a firmware name then construct a 
>> default name,
>> + * otherwise the provided name is copied into the firmware field of 
>> struct
>> + * rproc. If the name is too long to fit, -EINVAL is returned.
>> + *
>> + * Returns 0 on success and an appropriate error code otherwise.
>> + */
>> +static int rproc_set_firmware_name(struct rproc *rproc, const char 
>> *firmware)
>> +{
>> +    char *cp, *template = "rproc-%s-fw";
>> +    int name_len;
>> +
>> +    if (firmware) {
>> +        name_len = strlen(firmware);
>> +        cp = memchr(firmware, '\n', name_len);
>> +        if (cp)
>> +            name_len = cp - firmware;
>> +
>> +        if (name_len > RPROC_MAX_FIRMWARE_NAME_LEN)
> Hi Matt,
>
> As you are added '\0' at offset name_len, name_len should be < to 
> RPROC_MAX_FIRMWARE_NAME_LEN.
>
> Test should be if (name_len >= RPROC_MAX_FIRMWARE_NAME_LEN)

Yes - good spot, thanks :-)

Matt

>
> Regards,
> Loic
>> +            return -EINVAL;
>> +
>> +        strncpy(rproc->firmware, firmware, name_len);
>> +        rproc->firmware[name_len] = '\0';
>> +    } else {
>> +        snprintf(rproc->firmware, RPROC_MAX_FIRMWARE_NAME_LEN,
>> +             template, rproc->name);
>> +    }
>> +
>> +    dev_dbg(&rproc->dev, "Using firmware %s\n", rproc->firmware);
>> +    return 0;
>> +}
>> +
>>  static struct device_type rproc_type = {
>>      .name        = "remoteproc",
>>      .release    = rproc_type_release,
>> @@ -1342,35 +1378,14 @@ struct rproc *rproc_alloc(struct device *dev, 
>> const char *name,
>>                  const char *firmware, int len)
>>  {
>>      struct rproc *rproc;
>> -    char *p, *template = "rproc-%s-fw";
>> -    int name_len = 0;
>>
>>      if (!dev || !name || !ops)
>>          return NULL;
>>
>> -    if (!firmware)
>> -        /*
>> -         * Make room for default firmware name (minus %s plus '\0').
>> -         * If the caller didn't pass in a firmware name then
>> -         * construct a default name.  We're already glomming 'len'
>> -         * bytes onto the end of the struct rproc allocation, so do
>> -         * a few more for the default firmware name (but only if
>> -         * the caller doesn't pass one).
>> -         */
>> -        name_len = strlen(name) + strlen(template) - 2 + 1;
>> -
>> -    rproc = kzalloc(sizeof(struct rproc) + len + name_len, GFP_KERNEL);
>> +    rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
>>      if (!rproc)
>>          return NULL;
>>
>> -    if (!firmware) {
>> -        p = (char *)rproc + sizeof(struct rproc) + len;
>> -        snprintf(p, name_len, template, name);
>> -    } else {
>> -        p = (char *)firmware;
>> -    }
>> -
>> -    rproc->firmware = p;
>>      rproc->name = name;
>>      rproc->ops = ops;
>>      rproc->priv = &rproc[1];
>> @@ -1389,6 +1404,11 @@ struct rproc *rproc_alloc(struct device *dev, 
>> const char *name,
>>
>>      dev_set_name(&rproc->dev, "remoteproc%d", rproc->index);
>>
>> +    if (rproc_set_firmware_name(rproc, firmware)) {
>> +        put_device(&rproc->dev);
>> +        return NULL;
>> +    }
>> +
>>      atomic_set(&rproc->power, 0);
>>
>>      /* Set ELF as the default fw_ops handler */
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 1c457a8dd5a6..7a6f9ad55011 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -42,6 +42,8 @@
>>  #include <linux/idr.h>
>>  #include <linux/of.h>
>>
>> +#define RPROC_MAX_FIRMWARE_NAME_LEN 128
>> +
>>  /**
>>   * struct resource_table - firmware resource table header
>>   * @ver: version number
>> @@ -416,7 +418,7 @@ struct rproc {
>>      struct list_head node;
>>      struct iommu_domain *domain;
>>      const char *name;
>> -    const char *firmware;
>> +    char firmware[RPROC_MAX_FIRMWARE_NAME_LEN];
>>      void *priv;
>>      const struct rproc_ops *ops;
>>      struct device dev;
>>
