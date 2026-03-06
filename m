Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C174309F02
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Mar 2026 20:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827241; cv=none; b=Y1mZRnqIojT13WvrdgTdbnoAC+bywPbxSOpKrpytcM7/4UEZNCYbz4oecGnPML56H3dnXwUQfa0epyXAfuXjrjv03zzqwLzgM4gRdOO/6M95C/b+uIbdicwGV24gu/VYz16bGNCmZ6U+gxfTHhnYDIlWFgguuWn+fDSmvO/BA4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827241; c=relaxed/simple;
	bh=pbGgSdTnpxkY+2PiBhxk8UbO864vHB/UN+E1PY8xpl0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jj+SAg8GExZU/gt1xnxFM6Lys0958xVzsvXrezB/NY5wPwZnIAIvByjpcZye/Cy/ULKrGNQDmDRC51Q2r52zUiyZhgDQG6+rx5+oki25FQxAbOup1SqGPIHRKi55gLjen3QSKkCLvU72MZ2lGTirm0wVoJrnwud8uDg3YqvtGb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iolXTHdg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=crhQbNQi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iolXTHdg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="crhQbNQi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1oNj707465
	for <linux-remoteproc@vger.kernel.org>; Fri, 6 Mar 2026 20:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EiYJflmZS+8yawIrFdYuvTAy2GFP2luKLW8xrlAeVbY=; b=iolXTHdgTdjfeOyD
	ZD1CaIv9BfKoTip56GVafVAI2pWYzNyMQHZIxdjSM97kmc9JYu7asDOGkKqXqzrG
	D7A6EGYVAir86BPd0Fn5Q7raSMDJWV6EdF1O3A4hsajmSp3swGeGIcffEwCsft2n
	6APlbK6ZVqMBM6cG+C7pk5Kyz9Fnh30veQDKzcgTG1qjkwGPUVXTxVRF9i+aiQDC
	5JqWWkql44Xvn6k9P7HX6IFX1mIcJWe549u1vpndfMKiUifO7bDmCekNyqgD56xS
	T/BL//RE4mKtCpeGpFZaumI8aENVJTpmUafJihIs4uiLWyozER6TEuIr1RntP5wd
	ADUk7w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrukaubv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 06 Mar 2026 20:00:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2be21f89332so4665774eec.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Mar 2026 12:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772827238; x=1773432038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EiYJflmZS+8yawIrFdYuvTAy2GFP2luKLW8xrlAeVbY=;
        b=crhQbNQiLhNpgsC2VhH2tqdkir8Ymxa+zDo9TYfzyL7+s6qcjj3C/sjbmRLZJvP9px
         kifrSlb+81QHfkZuFkUphbC67CREKGTfcRFl0/E/BTtAA5gg3U+S4AIIVT5p+eR+pMxg
         McW2q99Y4XaGf+0gqdNmPPcyi/VdrfixWyfO/48BL02q3uAUN+GPXcz/gAac+HKQViTi
         cTY8dF2bW1MlNo7kzJ+098CRrGilioB6RM7SKDfWJJ68lGrggaUTbQ+JllAoaoL9rqas
         HXD03hFObHGQ0CoUazdz0XiaSNW2kgMNlbLldlV32z8cuUi+xPjPSaBTqxR4idYp4gb1
         k6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827238; x=1773432038;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EiYJflmZS+8yawIrFdYuvTAy2GFP2luKLW8xrlAeVbY=;
        b=dBQ7oR6/fUn+fZXr8SaZ9kK+KjNL0MT7iTR+v3U891Vf+C0BK56S1hZAIHuI5y1dQ1
         v5dYUrO/Te8KeKmp39tsO4YPRyagSRl6qbrVklxCcWLxMy/GyGRPm2jZni8XuyRvyezc
         lcVVfyfyJQyefpJbgMmY/xWyB4G1+Hi9k2Wxw6/pvgJhTR2BbFKsav7/lo7l4PaCsSz5
         Crf+zCIZZtTFPC7KbU6Z8lj38FoLUI74ibGJvIB5hT7qs+MjfzBnvJYWaOEGm0fUU/Ed
         jAKzRcMd05ZUPmoplgko1PLBMKZ6JUZYhnbXNtdKq5lribCzaN2FMak2ws+Dbq0fOB+t
         ge5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaTjKv5mOkVS+MhCL9iMhiKJtdxMnweIK0GhFofFMGMoTOrt4X4jvmDtBv4RP3EDgzRXdBTQUHQ0O6PREqNmXJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwJy2xYiDjX1+Ja1mGBBwZhD6cGzsnJQ1Q5lFMHcUUU72p3axIA
	0mR0/5FlQWIydJ4Cxr3QkEciLslj+OjwlRZWS/gmaFN0GOH5BTZ24AncFcuAeDm1umHDbZ8YKtr
	8LHaz9sNfS+m8S9SsYdIroOxzU0iV24PucUjSma/i+nsVrIrAWMGRF8aKaepG2/+9M/gUledK
X-Gm-Gg: ATEYQzxYSxR9VANU122dtnnPWxygAViWKhgHuQqzoqZdgfbIYON/32cVfoPfsFhZF7V
	OrhOJ7ND0V3Zi864Pfbk8sXJWfDpIB52ilMLbntEwIlfhBtjeu3x3KfGxUcEQtXXkQxC9gUMjBI
	Zha59hnx8akkPDwtARskisVEepmwQXXU69D6yAK1GDiaeDH7TkFS+xuYjOY6X+/KDpK8J+tr1oJ
	YyJ8+C00F+RtjYnPItrTBMTV34phhbYA7adQPDWYZeeHL1zjSKPfn8Fb/jHmtfM2lAsIXzfNI4F
	B88/HHgrXetCYq3AZT2wQWO5DGrQqXllhrrEIGZU61vaf79SK7TEoRqR8yrFCUb67/ufYTbba7Q
	dwAd/RPzhLJAZSd7n3OezUyXXTg63zG272m9QCOkMP0Zp0ebJNcbosvw=
X-Received: by 2002:a05:7300:a887:b0:2ba:7069:686c with SMTP id 5a478bee46e88-2be4e01911emr1342906eec.17.1772827235521;
        Fri, 06 Mar 2026 12:00:35 -0800 (PST)
X-Received: by 2002:a05:7300:a887:b0:2ba:7069:686c with SMTP id 5a478bee46e88-2be4e01911emr1342841eec.17.1772827234438;
        Fri, 06 Mar 2026 12:00:34 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96aa3fsm1798784eec.24.2026.03.06.12.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 12:00:33 -0800 (PST)
Message-ID: <973acaab-f2fa-4e2a-81ea-9d7fbebd1ca4@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 12:00:31 -0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
 <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE4OSBTYWx0ZWRfX4ehL4a2dhNBj
 TJOUGnKxbypdJ6IG7caz8tyk68RKtdIfOtyQYRmUnsQl6O4iSvtEjcAYyCLdu3ErxzgTj5+QFTc
 WCg1RVgI2V5zgAgmz2gliyGWCpBdznKhV3kQziMnRiUNZtedSJUISp0e7pnmU42iV/l/2z2zEET
 GkyvWph5DzaWR6b2mCML7EPOb6446nW/Oj5Auc6JojcW8UhoRV9Mkpb4DPDNCHvwEnxEKJn93Cs
 fhNHORiZ4Me/kSqHG8AuHH1I1JooM/mz9bQd/oRFz3UTC/Hi8hPVMui+f8r9I8Ng3Gh/ReZhzUT
 i5SPiWB2+UlQ3M3a9unVFjxNTTI/N5RMYC7rMsEUnfing6j+P7vjBr6+Ew/y7GF0139mkLM113a
 I6yyCZNfh6uwLAAIBCo0UsAXVe5RiVBF/P2NJSvDsOoyz1bNfKKOmtvDmEYnftiEvFLqTP8Tt5M
 QB5GZR41LkppdOeg0nA==
X-Proofpoint-ORIG-GUID: bYlG19CfRzeLt8MA6C9BlLFQ9db0JhU0
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab3267 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Dui5BcQmNnZPeg-S7-oA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: bYlG19CfRzeLt8MA6C9BlLFQ9db0JhU0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060189

On 3/6/2026 11:47 AM, Trilok Soni wrote:
>> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
>> new file mode 100644
>> index 000000000000..dc04ff1b6be0
>> --- /dev/null
>> +++ b/drivers/firmware/qcom/qcom_pas.c
>> @@ -0,0 +1,295 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/device/devres.h>
>> +#include <linux/firmware/qcom/qcom_pas.h>
>> +#include <linux/of.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
> are you sure you are using functionalities from these header files?
> 
> I couldn't find slab.h usage quickly and also qcom_scm.h. Can you please confirm?


I scrolled this patch too fast. I can see slab.h usage, but not sure about qcom_scm.h. 
