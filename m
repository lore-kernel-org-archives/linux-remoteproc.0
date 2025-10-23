Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748783009F0
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Oct 2025 10:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761214266; cv=none; b=LfBfmzchoaKO4mRuu78eUXLVXgOeDRHlse2+MmfLS6cvIMaKB4rt4/HP2NomUdZ0vhZNNDM6QRnZApcHVSK0doa6GIxPmzFeJxaz67hwAVLbrMc/KOWwk8kYTySFzpOB0USUwno9U8k+wOtIYlU3G/5G09TGC/EQurFlWDukmu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761214266; c=relaxed/simple;
	bh=qLVWI4esBCBNF7xpWlKAqG0GmKGFbIZLAfCdcS/Z+MI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TImkupvZCrkfSHI6oGl6l4LG2yRgpTwZBWW2Ws1jQeFdbYb8WzPghxx/AQbkjp9jLkNphW5Me2X6gxd2xPCeIGvOX3aqq6soO5EDSFMzFwmIurA6r38jdtpv+6EBG2GuyUmN1yQxBC1reJ2+Pfhy0X3kztUt46hBQKaC49a0S5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PdmkTEjh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PdmkTEjh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6dhn0028826
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Oct 2025 10:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UML1yqzrbQrPry4HepC8vV3t4zwpEH9yK9wTNqr1R0g=; b=PdmkTEjhYy74Piku
	o/rzY2pZzaSnTfurWYJ+nMcD+Z2vSvrjfeWbD4+vNPJSsQoWkHb1imjoSeyPfnl5
	f06t8xeTjJthYrgXjJW5Y2oMwqKVvH1dlT+3z0/llH9F+5ObN55oCURUAni5hd4w
	fDl7g98uzQAGvqMzhFcFSIm2LFrqhFGI5kdKNFKOr1n4nufjciODTzfkQ37ioaUc
	dWMAc6/JSX53oeo+AzNXxb5VmZiAFFDOg2snxx3hVVUpxykogKesbpHcfCM4YSDF
	F5dmXoqOArVJMPvrvgTR6Saf1pmRHf05Vpzkis+de7/jvmuz59NZaj0F6iL6/kkZ
	phdTnA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wdmrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Oct 2025 10:11:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62f9247dd1so574866a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Oct 2025 03:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761214262; x=1761819062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UML1yqzrbQrPry4HepC8vV3t4zwpEH9yK9wTNqr1R0g=;
        b=qVt4ql1Bd2gi5svzS8Dh6/xh7Zm2tq14cqmvZagQfhw/EvkTIhjwVIKmYe+J5iPEFT
         JOXCdxdn6OO6qwliaSJTW6Ls10lfjrlqbGYti/VxjoQIwSdBTR+bme7D393SziZU+Qpt
         9cGuFA6rOH4w13bgHyOnkh33LbpLnxY85CiNuqEl94hHwiMN0br4RnbeA7lhklf2eaT8
         YPBuqfXXhNHVMxAV2XZNhOOaZbiMGVUx3zD92EFJOBVo1Z4Gt6aXI53LYb+BtizCf0+D
         DxEyDfSd6oVnTy2R+Mghf2OFVcB3mlewzUu5xqPlL8pos0hQYdZfOh/fTIhi+FcECNZn
         uvzA==
X-Forwarded-Encrypted: i=1; AJvYcCUrMpZYxRfKUQFkAqOrawQC7WJQqy7Nfsix61Y3JtpL93WRLZLqiiTYEYxyTPgQ+SkTzNJTIl7/MeYNKAMC3Q7a@vger.kernel.org
X-Gm-Message-State: AOJu0YxVQfsBSOZZqtdxI7flt6HHfAUYkmLGiSKQxD5hhhCSBs6PGFZ5
	93OSUQBCQKZUCjZnwkRQmqAYGQvj4ByYcOsVvbVGJ8bSah4V85xu6s99fdtTBlLcGkMZ5E5Ivw3
	SttiGUkECqgaTc0C1Vadn8kBaWVZLGhmMo9Ct2ZKrV3pV8L75N+y0FP83oDYfVQQ1VrJnCCMb
X-Gm-Gg: ASbGncu4dVsRcm7vE7M3SyiLp5JHVsVo0u45TKH+76yZHUmnN90UVmBj2vlsjAWhfPt
	E1iix+6LD4nfZrK0oqUZ4/Ewkxppgou93TKk7Qwv/R8vNjbPtOklkVqvA0cOdi+jXT1l+IrF272
	g0+9Q/jMmffUcrbCV/xtspewHM9cwHlFt64C7G/cPnkq26yuP5JmR4CFZbOjwDel+sd+Y3dlFNA
	vJPmsOV8pfBdgIaFErInLfQBVy8LX1UyZusy4VBznS41SbYeBAjMHOhK1sBVBywPpHaU5PRrGn4
	Zr6Y+NqRy+tXGxtcYYkyYFDIQ38GRw5S9sDa5g997TUXTn2jlqA6iU3z0B4d3/lHQa84kAPgTY7
	hP0fUHNOj2vybUOOprJCFixYviFaoxdcjVGIrBBx7ixF5ttH9V8zhGM2qyo1vioiEnw==
X-Received: by 2002:a05:6a20:9186:b0:334:7aae:c43b with SMTP id adf61e73a8af0-33c600ad4c9mr2446156637.20.1761214262564;
        Thu, 23 Oct 2025 03:11:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFy40H0MW5NZRQSkKA5Qh1AhBvaXks0B6kqhFazrM8IjeVicGOuL4gdISqwRAuDa2V1gGJ8w==
X-Received: by 2002:a05:6a20:9186:b0:334:7aae:c43b with SMTP id adf61e73a8af0-33c600ad4c9mr2446115637.20.1761214262075;
        Thu, 23 Oct 2025 03:11:02 -0700 (PDT)
Received: from [10.133.33.151] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb9c8asm1654060a12.9.2025.10.23.03.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 03:11:01 -0700 (PDT)
Message-ID: <f8c315b9-acf8-4085-ab10-0d6e60ef7c39@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 18:10:56 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mtk_scp: remove unnecessary checking
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <aPi6eBlFLH43A4C0@stanley.mountain>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <aPi6eBlFLH43A4C0@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aVU14QUgCK_DaYmjmyEGgl4Pi0UGLiIO
X-Proofpoint-GUID: aVU14QUgCK_DaYmjmyEGgl4Pi0UGLiIO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfXyVhk5O6zYjuQ
 zKIzH2VQ/LFL5V9VzUFfu6rQI8QRQ9XSRwlj+nyNkuxU8qeyzdTzMJYIayP7jyBBhk1jiohnCb9
 tNtmSuMNcqBSZTCZh5joJCf4rjWrkSG/AXlUt138OsawB/bgN7d05EjN17zqfpl5AhUuXTDEz42
 PxJfRC0bYExhladaStK698JRhrJIMJArOeZzUSyG8vK9XvRvyTjNS9PJJBteCmL+kuHk/ZcVvcW
 C5io5qK9zlOH2VgRmledl8tPBAkb9+WaVV73Xt3kBlqDr40fl4+UJ+HZ+7PjB2KT2DKjT2Mf/uT
 WFzlQNQd5Pg9XdjUcjHvLRVQYY13lEr1FDoq9rLLNDSgjAhclsjKcS9tLhOuXsMoUZV/3139FrP
 UwUsnQzrqLPSBNUVFXdFClMJKDdnEQ==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f9ff37 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=IDcGV2vxZRipFm0qDp8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

On 10/22/2025 7:05 PM, Dan Carpenter wrote:
> The kernel implementation of snprintf() cannot return negative error
> codes.  Also these particular calls to snprintf() can't return zero
> and the code to handle a zero return is sort of questionable.  Just
> delete this impossible code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/remoteproc/mtk_scp.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 10e3f9eb8cd2..9b624948a572 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1127,11 +1127,9 @@ static const char *scp_get_default_fw_path(struct device *dev, int core_id)
>   		return ERR_PTR(-EINVAL);
>   
>   	if (core_id >= 0)
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
> +		snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);

Hello Dan Carpenter,

The patch looks fine to me functionally. However, one concern beyond the
current scope: if core_id >= 10 in future extensions, the
snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id) may
cause truncation.

scp_add_multi_core
       |
       v
scp_rproc_init
       |
       v
scp_get_default_fw_path
     char scp_fw_file[7];


To guard against this, maybe should we consider adding:

if (ret >= ARRAY_SIZE(scp_fw_file))
     return ERR_PTR(-ENAMETOOLONG);

or just expand the scp_fw_file[7] array?

Thank you~


>   	else
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
> -	if (ret <= 0)
> -		return ERR_PTR(ret);
> +		snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
>   
>   	/* Not using strchr here, as strlen of a const gets optimized by compiler */
>   	soc = &compatible[strlen("mediatek,")];


-- 
Thx and BRs,
Zhongqiu Han
