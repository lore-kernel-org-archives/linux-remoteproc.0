Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE11426EC5
	for <linux-remoteproc@vger.kernel.org>; Tue,  5 May 2026 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991236; cv=none; b=al06X+tFOlfQf15BLoa0RTFGiKqOxETE4S9ua6tt7FscGI9al2FLvqGxvPkz4HgRw5nglObCb6DHLkKi/UWvlHxQstK7eKijS0eLh2CTwFU9CrO7Unu1h8nf6a+Jqw1tz0E/TNtHl4YLvxYZoA9joc3RUJIUxkcmlmIviGJTzXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991236; c=relaxed/simple;
	bh=g+7IKxhiX7ztjndPO88YYZeyrSmovrRfOEc4pWd9eqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oCCyuzsFTZEopYzlms6y3wk9VmNYAf/GxEDa+BbhW4kmDP4bSmXe7kweEblgYiOc7jLU0otIG55JXNf1vMVgPy6FkOvco+Fe6z2G7JQF6J5vFNAKXNmh92b2rF4Pu4ag+eM+08FpTN+MUZkZ+61nhOA4EDWDsAoUW7iuMNXA34U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VElEevCX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IrrgRhKx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VElEevCX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IrrgRhKx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64595Y3I4028238
	for <linux-remoteproc@vger.kernel.org>; Tue, 5 May 2026 14:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pySiRqtx4zsZPi7B448XCfGRj+cLU/DeaDKDCajYXho=; b=VElEevCXAp/4eN7D
	j1foutEYx3Vr8neaXKIuICKqkE91uo573myvYqdDi3F5IXBbLooVoYNRod044YSw
	lR5mKzu4rIzdWRx2d/JbjvPxo63qQzGipzt1YBAOZDb5CwgrEeUBk9SQBK7yl7Op
	RnlGVj6RDVf2ezLny5rvOLp51ciXeHa568S8WVA1PeQpTaKKwley3XRb2f4jQskS
	Hmhv3KZWzdQeiQy5aE63//4swak+N6C1OmAAB5qmJA/QhPhJGZUGiWR296GpH8oC
	jGb+vyiCVHK5mJH+jvYSckZJgpYqawQ3A0oPr2XYkR5r+kxenrr5UZyU9vAXrI3h
	JzsaVQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dydm6s88b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 05 May 2026 14:27:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f1383b7439so1925000eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 May 2026 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777991233; x=1778596033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pySiRqtx4zsZPi7B448XCfGRj+cLU/DeaDKDCajYXho=;
        b=IrrgRhKxgJnx+fezZ1NeAlnQ6l4RiG2sFifsXMKlGHRf4C6wkOv8va1EnXq327cXkR
         0Nz/0bAcszpvtAoQaME6+f9ccs0W9h77C9SOyWIdiDwdolIIPKs2Rz3MlOtjdEmVHYXQ
         vqhckAwD/GZAUzvWI7Bk/UrDt1ptH2uFyuidpXph8o7A+fvqhcqhw1U/g9s8I8MEgyGQ
         zrwCRQYywin8U59zr2CSzF8o6OdALVBprz59rwhnjtWyfwdA0j59/N9/2jgHH9lS4r6J
         V30395+PH34urCGdOloCSoqrls0f+dqZH5l6RofWK0mSGpz+qrz+uDkg9xEL0y2g7UO0
         NjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991233; x=1778596033;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pySiRqtx4zsZPi7B448XCfGRj+cLU/DeaDKDCajYXho=;
        b=IOrwbKYW9FW35UtRujzEjNpUJ9MNkqJiuJ9pZbkYR7gE1rvOrRILmttUwAkcTXrrKS
         P5qMxoBBXOpSxS1s97F/o6V9bO6OonOH1glnjNMdTXFZ4xCMuHSAiHQ3f/K+2JaDOdf2
         vKq87w2lfYFHh7jassnam3kyvIcp3aRWez7arXoipg5gu/hlePqCSdIRiNdZ8IHpQegx
         /2AlQhsUBbab3Bq7543Ki6vVIFSH+zi/17vZXC8bHEfbmPUigtRxmdC/o/sVOerQvGKp
         8L5x4fcRcN5CYWVyFXdSHq9Qw71fmYqzMzxBb2uVcbV/yT+K70wgom6VLTqTc7CeuH4o
         z0Yw==
X-Forwarded-Encrypted: i=1; AFNElJ8NNIrwNbbIe0gX5iuRWkwZCEc3SofIuaeZzMYl+bDj53QuwCWgx8Xfx5b3lvW1NIt02QW2khXK8pe6uktrM8ja@vger.kernel.org
X-Gm-Message-State: AOJu0YwbSLJL0raoiaW4oZcbtmWYdYVM9KLQWWK0ecW7IYa0hUSuRZSN
	+b2ZWy/Vel8OSeIgxM7LBNjUaXOY15pXYbY0CTJBF8AT7h7VeNj76ILfHbIAf3ors+UonE6EmF3
	nzc5dY9gWVDXoH3tBtOYox800t3scJ7BHEKpnWcsrIXjVDum8GN/uJIDilubmkFKrO8JILWmh
X-Gm-Gg: AeBDieuNVOILvCjFuuybzAcIdJ0Jbo8RwEYLED87ATB3BDwtDDKl4hlpeBa+6gMBhCx
	ZXbkxGATz4QVlcpCBwZlDtPPpzwY2nRQ1Gk3/3EdLr9dog3dHu/Rs+p0VMIyMyH3M5obgXq8u9y
	Zvluf54ruySB89v+GI2NRW5sfJANdTPwZht2uh+DNdUIFEU0FobBvTNNwghH5DdgtH0lsoMZNE5
	hX1KSae/gmfS/Uqo7d+Cc3Deeba23wiSA0AEHjqcRbNWZUSQsqoS/lh1CeizwJrGKU3xbPaQgOh
	Y3GyhGdvPlmjlqh7Kv1+X0a0DnyYiXSmPBn9yOayta1MqazULb7l0wl3MRsr11VTczQS+lEv3Pm
	sFyfFW2CdwzHhRhZE9tfYUxHv+u9sCVpAvSebR+rvTpr2jEuEkmJLdlQp+SszjqhXfJOvqaVZN5
	CRALpkw67kiNqUYS9p
X-Received: by 2002:a05:701b:2507:b0:12d:de3e:86b2 with SMTP id a92af1059eb24-130a9ffb6e3mr1020201c88.21.1777991233075;
        Tue, 05 May 2026 07:27:13 -0700 (PDT)
X-Received: by 2002:a05:701b:2507:b0:12d:de3e:86b2 with SMTP id a92af1059eb24-130a9ffb6e3mr1020185c88.21.1777991232530;
        Tue, 05 May 2026 07:27:12 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84252c0sm23637548c88.10.2026.05.05.07.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 07:27:11 -0700 (PDT)
Message-ID: <3bfdc11c-115f-45ab-b0ab-75ad88dc6f31@oss.qualcomm.com>
Date: Tue, 5 May 2026 07:27:09 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] wifi: ath12k: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260504130603.1474043-1-sumit.garg@kernel.org>
 <20260504130603.1474043-15-sumit.garg@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260504130603.1474043-15-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEzOCBTYWx0ZWRfXyp5b2bde89t/
 0Tbz++YWnVqPvL0yk/Teqln0mcm5bH4wbQTTs1uSwy8tpF2TAbYAsNNhTZnkJBwCNMLq/81JDBK
 SVZTDY9unc39YVQuVvOqr/FBXWsLZz6tgG/AbwhtfakNg6FJibkUaxP1XkxnmbWWphGE2nbPjBX
 cSMRZ2gmKJOF+Xa7pkIldeh+OAgmEQbfhYKGBno7vNhYvzSTQwc4q76qvJZMd2tShbS+PVoDM4F
 cn/LncU+hW3IF6xn6zJ86C+jvV2jRhB5jFpFDCsR2AaFKPL6WEC/fdMawywUBsCUF2H3UmXbi0F
 bMLNGsbzNR6TRWp3/H7MzwKiWRj2MV9U+grBxtWPvIQbSsDjzJzTjwYHRZNF588QLPbdFKfzT1O
 mLzU1CLsXEIO1+xGtx42xA/2aIaJ+uz1fx5418UtI+vBMXmP7xTfUP3rKc1o5Q3MPlxmFKS3z8X
 9WxgWtuh+FGV8xb6hcQ==
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69f9fe41 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=_vM1m9lfSBLZ1nnPSXUA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Fui9dWHa7GILJ7i9boHRRTW_x5cOfwmt
X-Proofpoint-ORIG-GUID: Fui9dWHa7GILJ7i9boHRRTW_x5cOfwmt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050138

On 5/4/2026 6:06 AM, Sumit Garg wrote:
> @@ -485,9 +485,9 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
>  		pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
>  			 ATH12K_AHB_UPD_SWID;
>  		/* Release the firmware */
> -		ret = qcom_scm_pas_shutdown(pasid);
> +		ret = qcom_pas_shutdown(pasid);
>  		if (ret)
> -			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
> +			ath12k_err(ab, "pas shutdown failed for userPD%d: %d\n",
>  				   ab_ahb->userpd_id);

at some point the "ret" param was dropped, and this now generates build warnings

>  	}
>  }

