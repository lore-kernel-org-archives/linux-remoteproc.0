Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WMUmmg83"
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B62FAF
	for <linux-remoteproc@vger.kernel.org>; Mon,  4 Dec 2023 10:53:37 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B4IrSGY080567;
	Mon, 4 Dec 2023 12:53:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701716008;
	bh=+tTsHJX/DpgusTJRUaRslsPw9zd44xS0v9wtDvbsxzc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WMUmmg83yOnK4KWqX51zyDLxKoDfLnHVti6VMUb8lgBvL11gN68TSt4W1SKBDjoBx
	 BKtV+9AAZjh4h4R7lvN4e2P7/PosOYfxzKBI0nYv0QjOIbvVyMRRmArFRsxYqeeNso
	 wB6RtKADyDGM01df5acqVQuhTAiMiiqWhqgqcjGI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B4IrSeb001325
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Dec 2023 12:53:28 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Dec 2023 12:53:28 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Dec 2023 12:53:28 -0600
Received: from [10.249.48.175] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B4IrSKM114699;
	Mon, 4 Dec 2023 12:53:28 -0600
Message-ID: <3b569540-a53d-d84a-d8e1-1ccb1db219dd@ti.com>
Date: Mon, 4 Dec 2023 12:53:28 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] remoteproc: k3-dsp: Suppress duplicate error message
 in .remove()
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Nishanth Menon <nm@ti.com>,
        "Nandan, Apurva" <a-nandan@ti.com>
CC: Bjorn Andersson <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <kernel@pengutronix.de>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20231123211657.518181-5-u.kleine-koenig@pengutronix.de>
 <20231123211657.518181-6-u.kleine-koenig@pengutronix.de>
 <CANLsYky5tL6UZADgVBPEnPkN4GMKOhvn95oci7PywSZ2nyNXqg@mail.gmail.com>
Content-Language: en-US
From: Hari Nagalla <hnagalla@ti.com>
In-Reply-To: <CANLsYky5tL6UZADgVBPEnPkN4GMKOhvn95oci7PywSZ2nyNXqg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Mathieu, Uwe,


On 11/30/23 11:19, Mathieu Poirier wrote:
>> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>> @@ -835,8 +835,9 @@ static int k3_dsp_rproc_remove(struct platform_device *pdev)
>>          if (rproc->state == RPROC_ATTACHED) {
>>                  ret = rproc_detach(rproc);
>>                  if (ret) {
>> +                       /* Note this error path leaks resources */the
>>                          dev_err(dev, "failed to detach proc, ret = %d\n", ret);
>> -                       return ret;
>> +                       return 0;
> Please have a look at this error path.  As with the scenario where the
> remote processor is controlled by the remoteproc core, nothing can be
> done in .remove() to prevent the driver from going away.  As such and
> even if rproc_detach() fails, other resources associated with this
> remote processor should be cleaned-up.

Since, anyway the driver goes away we probably need a force cleanup of 
the resources even if 'rproc_detach' fails. Looking a bit into the 
remote core driver, the detach can fail if it fails to get mutex lock or 
unable to reset resource table. It appears to me failure of reset 
resource table is remote
IMO, we can throw an error message when 'rproc_detach' fails in 
'dsp_rproc_remove' and proceed with the rest of the resource clean 
up,i.e call 'rproc_del()', followed by calls to ti device manager to 
relinquish the remote dsp processor.

Best,
Hari Nagalla
