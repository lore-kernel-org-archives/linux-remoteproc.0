Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2822FE07D
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2026 03:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776138107; cv=none; b=ukFchoNELO2RH6cBkjssU44tX8iHBEVRV26J2Mc8hZk7+c7wdqutwTv23lqvQoMB+ulFnpbYRdI1IHCJYfmRhET7jQCelXsQfFVeqiA1ut7cSCR8tnVO/ez1qxrbqW8MJKPiiOJR6u0VVLyw+CGm+wv0dWqJVW9QAVlmUKo9QRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776138107; c=relaxed/simple;
	bh=Vrwsn0Qynugf+3jZEDc29x0q/HrfW395D70BhgcJIv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JiQCo3R+oUcktKh6o5puclkCZzevaoRt8aEg0iUZAuGEG2TkmUwQc1VGiWgxyqRkPr10uIV2usU5EzWT3S4MnqPwn+mEGgxaKyQWGGsdfKhPv27jXE/huuogHsmMXg1uT7Hx1+C9P+all9hWn3cSvoAkDmuQwMGQQIdhKMApLYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=as6qMz2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RC9AyHkZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="as6qMz2S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RC9AyHkZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLDiBY3681775
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2026 03:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/N1Ui71tI64FxlggBSULn1X9I+bgN0VJv4GfXg0nGc=; b=as6qMz2SrxsX2XXU
	KCvPXySPoiWbHpWcC+4ycXnOIw1tbgDHRM80pzF6e/Z7mvkhzAA7011/1Lkyrf86
	g4qfBwPrmpdN+p2v6DRitSQDGz4kh3afzreacNjk4egosIoJcMvcloOCm00H+4tv
	kO5XUxf1mAIKgxvYaGE35OpvuXMYET1FJ8cKgUBn19kQrczIiYGA0+a26Eg65Oul
	Rsy5UHsoTFZZ17zZfiTHre7Lvhh8y/a7QOqGcyjzBSvuncmeROH/k4FJ4EHcRQIZ
	EmoL6z53rQxS88Xf6gJ8JnZAZCwMQOq3PxP3jGVHZ0Z/SOrXU+CHhYaQVN1s6E+2
	USVpEA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d0utm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2026 03:41:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2e06219cbso30254035ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2026 20:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776138104; x=1776742904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i/N1Ui71tI64FxlggBSULn1X9I+bgN0VJv4GfXg0nGc=;
        b=RC9AyHkZc4Ur3cJxgJpYWHRifBSh8hl8W2OdTfZUy5hwAzPIw87AOUZmlRADbu543g
         IWxpBu9R/zppKaCv9QRMp9qEqhv/oCOcpNoASrJOpXPBbq3Ab++ib3hWADb7i50KpiRq
         WIk8THgEXv6MXGTyr437qOAnkVdE4wB2PTgEhxkwLrpnrokEf6oAF+gUVNLJs7CwXbif
         bZ3r5zT0uT6XgdS2w0w+sR7JIzCvb/SgThp9/lzfQvulRfX/6Y6TBoiQxPh9/+6vWwbU
         1y0w7QFsXkf0meI7HEc6ZKyAc6Dh0WnSvsEDSFPT5B4SzNi9mqkEqIOMDnttGvYYLZz+
         9RGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776138104; x=1776742904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/N1Ui71tI64FxlggBSULn1X9I+bgN0VJv4GfXg0nGc=;
        b=sXSUgNIR8j49a1ogK9vOW4yKWPgx0JuTMlKgO0IeLmnlKbtAFLW66MU2RFnn/xBHKa
         IPF5Jjwz8QU16tl/QcDwSuJdZbhAl7UkZ0fXZhleFMu1mx41ak1izPCsVcuMxw430i6T
         ko/YmbxJzKbcbAByD2fcvL4yt9aYbhz9CaOUeXvewVMN5SGb9NJdt8ZnwW6PYXU0nzK7
         V522zdxtjd4DPNZfKrRUBnvabq6gmhh7r/oXVFYQdNI0LURdzX0sFfVupK5s1dYWWDg7
         S5caGyHfLWewjHQ9fInGXjiPEaazHv3lSTy5krq8R74hl63GTlcVE5YaplbU9fQyn0Ss
         i7Iw==
X-Forwarded-Encrypted: i=1; AFNElJ9jXFVmX3R9r2ycPFqA3N45KZIr/7phHzd6yQYXJfFPvz22tv0kwqS7S01oy7qTuBQRK0kNRay37EK12KnzVlUg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4geBfzCeMk0Ed8kIfxU3fmm8Rqs1kOMDgU3JybTS9sSNyrZ5y
	r30f52AnJ7Hv+a69uqvcaqvWQ1f6AizNqeceORtqKXOzDmGjZudjg6xfFrlOh4i1Nj6zg3F2SYh
	MnOftQRr/mDBgoKSHGEwaP+gxY5/H/prcIejC0GMcsgGRuC4xPSlN+1hRC+btCOPOq7E/MHCj
X-Gm-Gg: AeBDiesk39pwIou2xEay9P6hCrAdAiDmbnxgXAwJ1g2xB5T5Bsb5La52zkkPptMNFQn
	6bRVmrKxNtBv7FfqdRDG3nWTXrh0EhikSCIz2WEDGq8tclgPaq8WNxHeZiuOR0qIWn/dtQojaMU
	tiUZ6uOYU6O+6c0/KXXCBUF2MChaPSTSSBGXWEH/VJIrw8Zbmdbywt9q+0vwvntWwv6duR+ndx3
	2KdkSkVGsYbOJigpQVhG5/WrPDPI6ZLSquCIY3FqtdVI3y5YjgEQT3MT5vuI+23tOEmgufNztHQ
	GKewNf0Uc3SF0VoZDQ2cAgDM7Qx5Uic/rUKOF0JekFKzDHVy6tYIja4Pa9KceS4Cq9WYlqLjhpi
	i5sbyKHFNStqy6SrK1GZFSS2jm+Xc4ay1GKJ3qxMe2D7KmASshJ/ZunRf7vJiYIr6Y3tjwnan8v
	PgSw48rR3JCTSQmw8=
X-Received: by 2002:a17:90b:3f0b:b0:35f:c22d:bddc with SMTP id 98e67ed59e1d1-35fc22dbfd7mr2462598a91.0.1776138104287;
        Mon, 13 Apr 2026 20:41:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3f0b:b0:35f:c22d:bddc with SMTP id 98e67ed59e1d1-35fc22dbfd7mr2462577a91.0.1776138103784;
        Mon, 13 Apr 2026 20:41:43 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f25d32sm135577435ad.57.2026.04.13.20.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 20:41:43 -0700 (PDT)
Message-ID: <846cf4bb-43da-4d2a-a128-bdaf1371e19b@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:41:39 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] remoteproc: core: Attach rproc asynchronously in
 rproc_add() path
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
 <20260409-rproc-attach-issue-v1-1-088a1c348e7a@oss.qualcomm.com>
 <adkI8Si4ejf6T73T@linaro.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <adkI8Si4ejf6T73T@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzMiBTYWx0ZWRfX8wH2Rm1gOZi6
 BqyI9q0+cZ7rFvcLX8mS1nYBPp4JsrV4fOrnQG9vv/nvQEo5vJbgfGGrsZghapJobMcGc49gk9x
 RMFVI3QGD1srI81EGHr8VawZmxRBQuLljla+q26/jXi6+oOOk75O2VQYI7t8vlfDp/1FgThqgOW
 jDiYSsg5l0HZzvyFURO4u+uk1mTQtKGUbNCd8siBsDHn07PuH3u/dHLzItIA8H7dD5O9ouqzYA+
 QQiZtUJZzu1HcdvaEbejJ/u8JCATfBc9w4AWPfrnJHk8/h8jBG3djH+k8SC0AfMYoeH0i9nmS8X
 6+VJWNC9rLeLIAUSO8dSblJYYI25xVF/U/0hwqBdhQSTFaPfUzp6oLvf4q/z8kfArjSsqs1glD3
 DvJeDE+IToi+oYPAPHB8Rv/p4w133AUFaAjwHxLOMYtStUJWHD+ePHX66rsR/alM8JBJD2KPziV
 54J87yu2B0z28jugeqw==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69ddb779 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sqA1CSfs5v188lrnezMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: -oskuGzKk4ZB_9y6M8qdMQTZaDsVfO4r
X-Proofpoint-ORIG-GUID: -oskuGzKk4ZB_9y6M8qdMQTZaDsVfO4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140032



On 4/10/2026 10:28 PM, Stephan Gerhold wrote:
> +Cc Bartosz, Dmitry
> 
> On Thu, Apr 09, 2026 at 01:46:21AM -0700, Jingyi Wang wrote:
>> For rproc with state RPROC_DETACHED and auto_boot enabled, the attach
>> callback will be called in the rproc_add()->rproc_trigger_auto_boot()->
>> rproc_boot() path, the failure in this path will cause the rproc_add()
>> fail and the resource release, which will cause issue like rproc recovery
>> or falling back to firmware load fail. Add attach_work for rproc and call
>> it asynchronously in rproc_add() path like what rproc_start() do.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 20 ++++++++++++--------
>>   include/linux/remoteproc.h           |  1 +
>>   2 files changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index b087ed21858a..f02db1113fae 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1673,18 +1673,21 @@ static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
>>   	release_firmware(fw);
>>   }
>>   
>> +static void rproc_attach_work(struct work_struct *work)
>> +{
>> +	struct rproc *rproc = container_of(work, struct rproc, attach_work);
>> +
>> +	rproc_boot(rproc);
>> +}
>> +
>>   static int rproc_trigger_auto_boot(struct rproc *rproc)
>>   {
>>   	int ret;
>>   
>> -	/*
>> -	 * Since the remote processor is in a detached state, it has already
>> -	 * been booted by another entity.  As such there is no point in waiting
>> -	 * for a firmware image to be loaded, we can simply initiate the process
>> -	 * of attaching to it immediately.
>> -	 */
>> -	if (rproc->state == RPROC_DETACHED)
>> -		return rproc_boot(rproc);
>> +	if (rproc->state == RPROC_DETACHED) {
>> +		schedule_work(&rproc->attach_work);
>> +		return 0;
>> +	}
> 
> I think the change itself is reasonable to make "auto-attach" behavior
> consistent with "auto-boot". The commit message is a bit misleading
> though:
> 
>   - You're really doing two separate functional changes here:
> 
>     (1) Ignore the return value of rproc_boot() during auto-boot attach,
>         to keep the remoteproc registered and available in sysfs even if
>         attaching fails.
>     (2) Run the rproc_boot() in the background using schedule_work().
>         [To improve boot performance? To work around some locking issues?]
> 
>   - The actual issue you are seeing sounds like a use-after-free in the
>     remoteproc core error cleanup path. I think this one is still
>     present, we should really have a call to
>     cancel_work_sync(&rproc->crash_handler) as Dmitry wrote in the
>     previous discussion [1].
> 
> Thanks,
> Stephan
> 
> [1]: https://lore.kernel.org/all/ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m/

Hi Stephan,

Exactly as you say, what this change do is allowing rproc_attach return false.
It should be okay to keep this change and describe it more clear in commit msg
in next version?

And the use-after-free issue is what we want to resolve in the patch2
in this series, I think cancel_work_sync() is a reasonable change
but it cannot resolve this issue as the worker could be executing when
we call this(and this is what it behaves when I did local test) and
the use-after-free issue still exists. Shall we send a separate patch
for this cancel_work_sync?

Thanks,
Jingyi




