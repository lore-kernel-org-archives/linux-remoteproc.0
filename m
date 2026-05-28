Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD8A244687
	for <linux-remoteproc@vger.kernel.org>; Thu, 28 May 2026 03:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779939085; cv=none; b=LlwDjF7SFZwqRTvnOsNiWDzJTw4qBLEfjgB8MdXCeQ8D4CWsfg0dZWiNJbM/z0lBq1E+NCPznWFfJQxUbskso0xVSCAeSsrTrqcDtB0BOF82xqMdVQskauQAu9pPKHe5/qRG9/qRMvw9GedY9L5hc9UNVLxbsmEhRjvbJF1q6YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779939085; c=relaxed/simple;
	bh=du2G9E0eYqG3UwmHKht+kFdDKGQAkHnhyxpzU8Jme40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q1XpP0gwMXmqKEoTo4AsU9XbwlrG5KofIIkM6V0SZRgMIrrWb0KB/8hXYG5vm4NnGArdpBN7FzGnU+9qGOqvtHscyACSeiGt/upG/j7Y8ZMkAHNtbRzMCkJqhcqIKaaPGMAWnUXgn78R3g4bS7JnlOfvt2qMHHn66WfKCgIc88A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BARKo82Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A8DpJtb7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BARKo82Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A8DpJtb7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKnJOs3010208
	for <linux-remoteproc@vger.kernel.org>; Thu, 28 May 2026 03:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	obRGzyMev3GPdcUIXXbGVZQIyEJ+0cKopg6lhDeWLhY=; b=BARKo82YVAz1/2Pf
	iP33St2iHDusefBDwPI/Ib5kGuxHg1UzrQfu3m395bj5WZfERCpO/HK0A8ToT+re
	kS5b4DWPPSOkJPffttY+8Mfluc+gezUuII6izutjYKuyO5OYTLp+LFL1Tvl3mS4d
	k+OcvzePvqb+aynMzoWlY4yBrue5sQEPdlxvSAV2flNQideFbxktB7BwFw6vDu+p
	XzL5wUQk7FNt1KUH5V7AHsKfRj6rXqK3dJl+72b0Ie4Eng0Doaxk9xbM0lyJzeSd
	JAritaE+yfiJTnszFxFP9ppJ5RGjC2hgqkVsvSjy37ftZaYWmD51pGrpYA3FFFqw
	NPYyfw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yrh6cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 28 May 2026 03:31:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b458add85aso136578455ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 May 2026 20:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779939082; x=1780543882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=obRGzyMev3GPdcUIXXbGVZQIyEJ+0cKopg6lhDeWLhY=;
        b=A8DpJtb7gwl9gbxFdOUvQEfxpS45Lj2bsbgDOPW59upRM+zKRcTV1Wtauy/L4MyiNL
         b9mnP0iFbmAnxS88ZaAmeD3q8tcI2JmFgAtQUs2m1PJyi7ayTZ5kHCFH5LDhX2N5OkkD
         0+5QZjN8y16LERqmcyEvUvg2RJMSt/hQGzsSQPQcoySnBWGx5qaPngUE75aJNPRLzWlD
         /T7oeeZOYkGfGVy7CXONZSjd650SrzbNmM9dAUcrNhX6ZCdWVqZftxIqMlm3of+d+/+n
         PpYJMjhAU/FsZJWP4aNk0haHSRYV+VFpLpDXAjup59GgY3sqWTB5i3HL4kuU7/+u32qN
         RoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779939082; x=1780543882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obRGzyMev3GPdcUIXXbGVZQIyEJ+0cKopg6lhDeWLhY=;
        b=UKrlZzFlHLvanoW5WsG3ocqsIGs22hk7p6PLZNIOYX7xXDOx5/nSCddju33LCLS1FK
         v/nr0BWcTEef8RmVJAcs2Cdifa26jzKLQs9GYDireZdf3BibQyU31yBr3+IK9/uZ0keP
         9Z0iYU5evavcWfcDr2yDzlP2gswTodOhgakuA84u5NWsGQLWqLeqnLIReuUphJnD/uen
         cniJuzuCh9oHfcvdRr0wq2KI0zQwq3xTeNoFEARmBmoNHPWr+30nqivbt6M1TkNemB2e
         n28wX7EuiF/ufKPekjNPdAqW+gBW3CiVogrXbuQKQ1mOcNwDy1v9xhUGBWIPqeJNIlue
         M2Fw==
X-Forwarded-Encrypted: i=1; AFNElJ9R1O90fsRgttVFhm4gjGJo3x4uFGGqygK1bkreJxLJNPepqDSaq0LkR+OShQmVJAr7vjcXy1teGQdD+EgwCoOf@vger.kernel.org
X-Gm-Message-State: AOJu0Yytd0JXNlaugLe2Pb0H7VxTP7dzqbOQtqfrNgOuP4Mk4153kRGw
	goMNfOs3Z56bE4pfVwuYHE7r8hpj56HI32evWeZJbqSghN9e3k6t9I03PDSZBczMRMcicBHhR0B
	VwfdU7nXPDG6asl2+5ExU6ZccHM+ogxm5/yjCmOpPo9se1xWWx7mC4FjH1Wd8ivJYkYpHuFMQ
X-Gm-Gg: Acq92OFPwXiomWrUK9h1uf+TTWZ9IGGERwLRt0d3d4yrlptd+gLVxVyyhEg4wOmKt9F
	rmJygZOu2f77NuBEk2nAa2rVAf+XhLU0ponHJt5tv9PTK/e9281ePtHg7xXu54jkBVHgGbhHqIQ
	QB3b0hMsYAyC/iwfmhJWJ15x0X+25cpEgZpoJicUw9m2nrQE/zpPI01Z1T1/Fdz4EzKEUj96QUF
	fNgcM65ACd8OGPM9EZrBr70kqfooZC6U5IJoeWvZOkkD640oCWG7VmbZPYawA7DeeIyjggpGnIJ
	4YmJf8j6sKfWSfq3aQCWoHSOY97f/Uo96GrEi8MMKQ1vY/Ld/WLt+XLaBXZS82Ppk2MArW3PjJ1
	0w4oRpIu2rCEPC5Hf+eXOagMhz3r2UTgKdsj0EkPVPxvqby5Bm2xwvWiJsAyk5sc43Xl3n+uA6y
	n6mfZEy2jN2BCCHQrtxQjgYq6zCP4=
X-Received: by 2002:a17:902:e885:b0:2bf:26d:3f42 with SMTP id d9443c01a7336-2bf026d491emr19844385ad.18.1779939082511;
        Wed, 27 May 2026 20:31:22 -0700 (PDT)
X-Received: by 2002:a17:902:e885:b0:2bf:26d:3f42 with SMTP id d9443c01a7336-2bf026d491emr19843835ad.18.1779939081994;
        Wed, 27 May 2026 20:31:21 -0700 (PDT)
Received: from [10.133.33.221] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf0825ee37sm6238045ad.41.2026.05.27.20.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 20:31:21 -0700 (PDT)
Message-ID: <a15ce5d1-f2f3-4831-a79a-d6662390c409@oss.qualcomm.com>
Date: Thu, 28 May 2026 11:31:17 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] remoteproc: core: Check subdev start status in
 rproc_stop()
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com>
 <20260519-rproc-attach-issue-v2-2-caa1eaf75081@oss.qualcomm.com>
 <ahBItk6iPQTGaZWT@linaro.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <ahBItk6iPQTGaZWT@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAzMSBTYWx0ZWRfX/fY5nZ8KcJNw
 Q66hkdFiQe8O8ofiy7Vc8cbjTbVZg7SaGdFNHoEsSxx+5v8uYW3Spi8utO3Z78SYQsBJAW0cQEb
 f5vfooE4hcqphVb8upUX6Hd2SlRPkNJ/vA0xQwD052LiDSxkShGdoak8NHw228UOSe4yfIejaVE
 72UEPsoh2tHr77watLlyK8xhK8Oligq14Hzyo4lCCzqCdnYzpiIrXXDUDImwmpaUl6dXsE/8tz1
 Dbn4grO4wSUw3kaYP+1QiUdpbLEZIqg1R7NzJ61FPgEndPxt+SLZJnRP4ydN8VntDnNDYaO4hJG
 AEpzrneAZlJk9xGDLuOc3sRA5NZaGF1zlwxhpY8N70azfP2b1xLg/bKfLkIx7zUEIx+ZeM26rlU
 3YQqKAzuFLOOdHDHnU1vtQsjkU0/FF0mE/FFnV3qySV39azj80aEYvlJrZgauOrSYPlVaxNM66B
 tzpRYDZZ4iFcUGuRoBw==
X-Authority-Analysis: v=2.4 cv=PLo/P/qC c=1 sm=1 tr=0 ts=6a17b70b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tv7k-BTZGpM39zBJeD4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: lTm0Ul_g8k4rCmKH7RBOUBpRZG_FIMbJ
X-Proofpoint-ORIG-GUID: lTm0Ul_g8k4rCmKH7RBOUBpRZG_FIMbJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280031



On 5/22/2026 8:14 PM, Stephan Gerhold wrote:
> On Tue, May 19, 2026 at 12:20:03AM -0700, Jingyi Wang wrote:
>> For rproc that doing attach, rproc_start_subdevices() is called only when
>> attach successfully. If rproc_report_crash() is called in the attach
>> function, rproc_boot_recovery()->rproc_stop()->rproc_stop_subdevices()->
>> glink_subdev_stop() could be called and cause NULL pointer dereference:
>>
>>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
>>   Mem abort info:
>>   ...
>>   pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
>>   lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
>>   ...
>>   Call trace:
>>    qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem] (P)
>>    glink_subdev_stop+0x1c/0x30 [qcom_common]
>>    rproc_stop+0x58/0x17c
>>    rproc_trigger_recovery+0xb0/0x150
>>    rproc_crash_handler_work+0xa4/0xc4
>>    process_scheduled_works+0x18c/0x2d8
>>    worker_thread+0x144/0x280
>>    kthread+0x124/0x138
>>    ret_from_fork+0x10/0x20
>>   Code: a9be7bfd 910003fd a90153f3 aa0003f3 (b9430000)
>>   ---[ end trace 0000000000000000 ]---
>>
>> Introduce "subdevs_started" flag to indicate rproc_start_subdevices() has
>> been called successfully. Ensure subdevices are only stopped if they have
>> been started.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 4 +++-
>>   include/linux/remoteproc.h           | 2 ++
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index f02db1113fae..6e23cb11e515 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1308,6 +1308,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>>   		goto stop_rproc;
>>   	}
>>   
>> +	rproc->subdevs_started = true;
>>   	rproc->state = RPROC_RUNNING;
>>   
>>   	dev_info(dev, "remote processor %s is now up\n", rproc->name);
>> @@ -1712,7 +1713,8 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>>   		return -EINVAL;
>>   
>>   	/* Stop any subdevices for the remote processor */
>> -	rproc_stop_subdevices(rproc, crashed);
>> +	if (rproc->subdevs_started)
>> +		rproc_stop_subdevices(rproc, crashed);
> 
> Thanks, this approach looks better. But where do we clear this flag?
> Shouldn't we do that here?
> 
> In addition, I think we also need to set subdevs_started = true if
> attach succeeds. And clear it when detaching a remoteproc. I think you
> just need to update all the callers of rproc_stop_subdevices() and
> rproc_start_subdevices(). Or, which is probably simpler, just make the
> check directly inside these two functions to cover all users.
> 
> Thanks,
> Stephan

Thx, I think it be better to modify the flag inside these two functions.
Will fix in next version.

Thanks,
Jingyi



