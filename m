Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CB22FB967
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Oct 2025 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761566119; cv=none; b=HwqlU+vGE375gFiAoa1wSFMkNd1ffLWH+n/dhWzcTR/NXKFTPcPsvSz+VcZwyRB0m3m3wqoyxws4G3dTLyQBDrSiOLOucV9EaHNDuAa/cWTe35EC83b1mdLl4KWLLmjZL6E4vIEc3UUwi9btOT2fUOvmr5NlGJheuIdyleDjQu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761566119; c=relaxed/simple;
	bh=s0aokbeBV/ht3ahPvmPE5Hx1GouHUyuPwC52VaMCS54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+iOBNX0Z3H/Rt55EcAiFgMmfifiRaySDdVWepDSsCsWVTiBvriosj+K2ngcAyKHbnbkz519o3doB8cvgiQwEQR0IV8JYM12/lUYw1FqFAm1NEDHpkkx68I96gwNhvYgWw4R7LEMrmTnCSfevT5qpyENBmI/fIFXqhey+aoMoVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNRPH67Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNRPH67Z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R7nkGJ1065061
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Oct 2025 11:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWAM/1l3ob/3LqSmNYM1Kzzm3JAMnpjQt4pTVWbHtSU=; b=cNRPH67Z1NyjlP86
	M3mT59D+2BjMtjmwTDK4eOBY5D48EYOjfmoKt45lQ91fdljCtvuHEmWbjcvu0jKN
	qvGFPVMEJobVnMbfmWfgwW/0VxH+7AuzzTvZb4skfqOMI9qISCFUwlnEbz43bGA0
	//bJ4mw9Z0bu2PkyBcRWpQQmMa/U+MjAxRu/a5C0mhUp5qezSrfGK7//NzvQHkTj
	Zwdaqj9sY23LIXHqbOk/gx7gjt+PSV8cGkioWYe/BsryN8ruQdJY3dkBCzvrLyQM
	CTfdvPZ/yDfz8eOrfR8Eni4x/ELomNWnlFqbmEV2fZH+9ng5aIdxy4ZsYiGJzqaD
	8Pp1Uw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0ps14cxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Oct 2025 11:55:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a277277cb7so7641370b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Oct 2025 04:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761566115; x=1762170915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWAM/1l3ob/3LqSmNYM1Kzzm3JAMnpjQt4pTVWbHtSU=;
        b=TTosZigUP9en3AkODt6sF9mjZUu1oz6kQPjjyqplUqhr3aBkSiHHtCh8MVo5LgDygu
         PUFrp+nv9xMgOLQO36G7SmMhEgKe6gUosMVqigENZyqD+HV21rgdTwWgGBDHs1LmxhW/
         jtD2bTOPhqkA+ZM2ueZWm0RIDJYqfF/Ugv7U3LQdvdIVAmREVyFOl4hmXuE4NcFeteTI
         VTCBUbzrfzUJwiEqFrh8Pg9yr2+CT82B28q4Rjh6ip1EnlTwyNZ9YAt9qGmqElOnyxuC
         VryfvWr83skTPwAZ9QoULwm5a4A82/g1r5yPgoSN0RtcLa7xex17v/IIJ84FKpyKcITX
         wWMA==
X-Forwarded-Encrypted: i=1; AJvYcCWrEciwXhgEmZrEk+0S7YrXF9eub3BCUZBVVaWzcntGtnMaHYwbxsnU3jnKNEG8tfggBrobv8zXHO3UyFtvzV0c@vger.kernel.org
X-Gm-Message-State: AOJu0YwG8+K6+FkSRdQGy8gs6qZ2wKFwbgmYSPeKl7kil5DIBE9btNyz
	nglCfm13fXgL0R5cwHxprrpEXnmmTDqd9FgUq+9g/pOtx/RE/lSqcGINE5qlgs0aYaZaua7Vsln
	TqpwABfJ/v+dlOpHGHNx6RwBSo9g4IISmnkJR4vKR/MwHjHar4ksWMyuvdNfy8+D9yjnVHDw+
X-Gm-Gg: ASbGncu/FeCvxL/sftb/TVDc9dcAUAqdsDmV4dgoT8lWCgA+0kjsZSzGZlqMN+MXb2N
	x8ycd3vx8xeqYAAkpX4vmr1MGydchTMVvKHq7086wDngjpZMhFgzDmNG1/d6Y7sx//DrI4MXZBt
	UP4RjA2q97dbS/UgXHM8Jj6Wlp+iDWUEiFCVjKCJp3uztReG1gAy8XmjZnmNDgY8D71dIlLSSyx
	8jGyX8o4TF+JB3oEnIGidxebm/TumsuYWmazJoEbp9weQOlIb6kfcy4d9S8XlRDbgF07s8Xhdtj
	ECrBM/wBi7L1ZxyJXPGxWoR6azrffFGWCGrOIMzKqJLbKq+kCsj6//XUUUeADQrD+erZkJZfcsx
	xa9lBH5UMhDf1YcK3mAw7ppPSHIIxZCxse9mXVdpRIZ+kMkQINR/e4a+yHwo=
X-Received: by 2002:a05:6a00:1803:b0:792:5db2:73ac with SMTP id d2e1a72fcca58-7a28674d25emr12047802b3a.7.1761566115145;
        Mon, 27 Oct 2025 04:55:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGGkAcnkXHKQF/eHcUEuUAMP8k34i7aRfOMaE7hRoA4fzc286ygZftSP3+bEdiIYw6mSvSXQ==
X-Received: by 2002:a05:6a00:1803:b0:792:5db2:73ac with SMTP id d2e1a72fcca58-7a28674d25emr12047778b3a.7.1761566114705;
        Mon, 27 Oct 2025 04:55:14 -0700 (PDT)
Received: from [10.133.33.217] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4387cbf00sm1985642b3a.2.2025.10.27.04.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 04:55:14 -0700 (PDT)
Message-ID: <9d6d7641-d2c0-4629-944c-1bb88eddc486@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 19:55:09 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: mtk_scp: change the snprintf() checking
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <aP8agyKj73bLZrTQ@stanley.mountain>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <aP8agyKj73bLZrTQ@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ju78bc4C c=1 sm=1 tr=0 ts=68ff5da4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9rX-9eNafPfUpquPNkAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KDreEA9_Zp0p1JlXigIlvb8ELPvv6Cz7
X-Proofpoint-GUID: KDreEA9_Zp0p1JlXigIlvb8ELPvv6Cz7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExMSBTYWx0ZWRfX7XmIH19Z8JzW
 0bw1fSc3NjJmT3wxImuU3hFcTM5nERLn4SRZOFw19qhVS2+oBmgr748jwRRfvg0ebK0EXxMiBQp
 NTkGIqm9vLI7XGrupVne81eOjwTEjlZmvCqI0X6xlwXplOc0XOcMdbGHTR8x+bWpF1tkcVSgXQ9
 kAZVWL9upZhGU3pDPfNLdfq6rAFLY2dAfa7SHLf9p38y8cWw7c6l2KsQhqT7IhTx9Ls1cFLRH58
 N0N5bhnNnXmPhdLrXKFVAjEk/y7Z3XNLii7cNcmCJBJXV2hWSzQM0b8MKFeG7EUM5RcLtPz4PbZ
 ce3GKO1X5AmeGQZ0AUmV8tncvUXaOVo37GOWNuhTLcC+96q+5fAqbp6/yLcPTa1UIhwLMbTPlCP
 qWqjwslKsCu8tXDqNQWexqMNiHhFsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270111

On 10/27/2025 3:08 PM, Dan Carpenter wrote:
> The snprintf() calls here work but they have several minor style issues:
> 
> 1) It uses ARRAY_SIZE() which is the number of elements in an array.
>     Since were talking about char that works, but it's more common to
>     use sizeof() which is the number of bytes.
> 2) The printf format is "%1d".  The "1" ensures we always print at
>     least 1 character but since numbers all have at least 1 digit this
>     can be removed.
> 3) The kernel implementation of snprintf() cannot return negative error
>     codes.  Also these particular calls to snprintf() can't return zero
>     and the code to handle that zero return is sort of questionable.
> 4) In the current kernel the only "core_id" we print is "0" but if it
>     was more than 9 then the output would be truncated so GCC complains.
>     Add an "a >= sizeof(scp_fw_file)" check for output which is too long.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> ---
> v2: The v1 introduced a W=1 warning because of the truncation issue.
>      It's a false positive because GCC assumes that "core_id" can be
>      every possible value of int but actually it can only be zero.  And
>      also generally, in the kernel, truncating is fine and it is fine
>      here too.
> 
>      But let's use that as an opportunity to do more cleanups.
> 
>   drivers/remoteproc/mtk_scp.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 10e3f9eb8cd2..db8fd045468d 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1127,11 +1127,11 @@ static const char *scp_get_default_fw_path(struct device *dev, int core_id)
>   		return ERR_PTR(-EINVAL);
>   
>   	if (core_id >= 0)
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
> +		ret = snprintf(scp_fw_file, sizeof(scp_fw_file), "scp_c%d", core_id);
>   	else
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
> -	if (ret <= 0)
> -		return ERR_PTR(ret);
> +		ret = snprintf(scp_fw_file, sizeof(scp_fw_file), "scp");
> +	if (ret >= sizeof(scp_fw_file))
> +		return ERR_PTR(-ENAMETOOLONG);
>   
>   	/* Not using strchr here, as strlen of a const gets optimized by compiler */
>   	soc = &compatible[strlen("mediatek,")];


-- 
Thx and BRs,
Zhongqiu Han
