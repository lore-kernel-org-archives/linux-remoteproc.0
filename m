Return-Path: <patrice.chotard@st.com>
Subject: Re: [PATCH v2 1/1] remoteproc: core: probe subdevices before booting
 coprocessor
References: <1481143768-16377-1-git-send-email-loic.pallardy@st.com>
 <721e66d1-7a0e-477e-532a-4f7daf295f23@st.com>
From: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <d5ab9f2e-7e21-47e1-c495-b71868939995@st.com>
Date: Wed, 4 Jan 2017 09:12:11 +0100
MIME-Version: 1.0
In-Reply-To: <721e66d1-7a0e-477e-532a-4f7daf295f23@st.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Loic Pallardy <loic.pallardy@st.com>, bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>



On 01/04/2017 08:40 AM, Patrice Chotard wrote:
> On 12/07/2016 09:49 PM, Loic Pallardy wrote:
>> With subdevice support introduction, coprocessor boot sequence has
>> changed. Related coprocessor subdevices are now starting after firmware
>> and resource table loading and coprocessor boot.
>>
>> But some subdevices can resources to allocate before coprocessor start,
>> like rpmsg buffers allocation for example.
>>
>> This patch probes subdevices just before loading resource table,
>> to keep backward compatibility with existing firmwares.
>>
>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>> ---
>> v2: remove unused stop_rproc label
>>
>>  drivers/remoteproc/remoteproc_core.c | 18 ++++++++----------
>>  1 file changed, 8 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index f0f6ec1..61f06a7 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -913,6 +913,14 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>>  		goto clean_up_resources;
>>  	}
>>  
>> +	/* probe any subdevices for the remote processor */
>> +	ret = rproc_probe_subdevices(rproc);
>> +	if (ret) {
>> +		dev_err(dev, "failed to probe subdevices for %s: %d\n",
>> +			rproc->name, ret);
>> +		goto clean_up_resources;
>> +	}
>> +
>>  	/*
>>  	 * The starting device has been given the rproc->table_ptr as the
>>  	 * resource table. The address of the vring along with the other
>> @@ -932,22 +940,12 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>>  		goto clean_up_resources;
>>  	}
>>  
>> -	/* probe any subdevices for the remote processor */
>> -	ret = rproc_probe_subdevices(rproc);
>> -	if (ret) {
>> -		dev_err(dev, "failed to probe subdevices for %s: %d\n",
>> -			rproc->name, ret);
>> -		goto stop_rproc;
>> -	}
>> -
>>  	rproc->state = RPROC_RUNNING;
>>  
>>  	dev_info(dev, "remote processor %s is now up\n", rproc->name);
>>  
>>  	return 0;
>>  
>> -stop_rproc:
>> -	rproc->ops->stop(rproc);
>>  clean_up_resources:
>>  	rproc_resource_cleanup(rproc);
>>  clean_up:
>>
> Hi Loic
> 
> Acked-by: Patrice Chotard <patrice.chotard@st.com>
> 
> Patrice
> 

Sorry i selected the wrong patch, remove my Acked-by from this patch.

Patrice
