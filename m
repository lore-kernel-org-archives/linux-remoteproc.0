Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41583236A73
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 06:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779345029; cv=none; b=rDYgy/YsAezlGpb979jCKltWE9seeYiFiPzKuAwHGqQXFbkNQwViwNJ+rYSv6OkSoZX7IeCcOOkfphnsExgC5kkQXRnZSJ63f78UfwitEOKRVsVSb1uUSEr2bx01kHzQ9NgotJDvQSah+MAS/8SZoiONcAf+emXCqM/v1DD2pPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779345029; c=relaxed/simple;
	bh=fq3D+X3q7ZbEaR+KGlXHcg5ZzcIxpXF+jpXKklId51Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZUzXFf0LLc4g6RU8YRMJuhWsUvlFBTPTlBsxZjlYznfTjI5OBnUyQ27jk0AB1OzZSyG/t9ZBl6cfw3h/KqMsWxEROajBl+M1rT4I1pbPLP6svig7akxcRXKnac24vIf1D2JYgXawqJKO4c6xeay68cgHlsEeLF1NmAwUTkY2Bd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7k0N3xx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpDQDErk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7k0N3xx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpDQDErk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L0SpKg748558
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 06:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EcFnBmlGXUBnGQMannLvnZzhlvDc+81ZD8yCnd/foBU=; b=g7k0N3xxmtSzuTP5
	5D5t/X8ZeozBD6m1DF16BcKLvbd8VFULNoVRu3uRU43O+y7D1vZNfucCYlLcKJFc
	vl8fgFjDHUizBRQxRNmKP9rssOaKgSyHgpZh8HHzK+rTyzCjDzMwwK1kWDdqnGGr
	RZI7xXViQQI/bw1w8wH+Pm3wj8bhhdrR9zkLFFEE0g1Y3FXaID+SiKVJeDeihTsU
	n7YL2XKftFfGTCJSwgkijIzC05xOMpqTZr0mTHTaXR6UpEGEdecBbazHnwENBMoP
	qEe+rHKVfhZhbu85Ju9OiX5jOjVCKaDdoTrdDSJIggA/Mmr5UBtvw5l/STBp1VWl
	QsWIYQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6k1mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 06:30:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4530a90fdso101845705ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 23:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779345026; x=1779949826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EcFnBmlGXUBnGQMannLvnZzhlvDc+81ZD8yCnd/foBU=;
        b=fpDQDErk954TcX/yljyxsujGFt4aNcwgp/2G+HlauCh15AGvwjgqmkMPk4lbfV5qCV
         4bPNSR3kAZBVD+M7ajuSufey0k2eI/0QvQI/43HaB94WSCWfgzYCO9goj92C4Kv1jKVa
         bnthsYoB7hWqBs/JmMyRWFBvyI2rJy3A5hqdv2dOTF/g2v53YY0XqPG/3JSJsKKf9aqj
         +xdkfsRd5sRBiBhyFlW+++h0Km0qREaY8mna/EqZPm0Sp5Umee0pP8qooPyc+Aj5dzYn
         V1s9bliqM9xsjQHGPOY64Xc/Y6LIgVIH0lINmQDaPXyTgYK7U/eOPIpLR3UXk7/M4XGf
         r+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779345026; x=1779949826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcFnBmlGXUBnGQMannLvnZzhlvDc+81ZD8yCnd/foBU=;
        b=JT8nTsKUnp+PNGP5624dLzW26upy3lGORXtPpCfEAhUPurSIEvMVYLU48On/7gUwLC
         SqjAdzuTd0daCowKTUS2S9xr1FsO6IlCZZxIoiJTjU1Nx6/ac5hvIZZ3sNsvmola4aR2
         bD3OjrNHNbl1f7I3G/bk3OvnG/OVy1d5ykEwLBr/o+ZI57JIZQJmeRpET1cchd+AhpMV
         isA9TaFDQbRXFeSWJtTLkGWShoWNTJOUN2v2vK2oLflFYLsbpIobGEyZVJA2bZ6mXy6Q
         JM1+89COB4IfdybgCYhCerUeBIeSAlHn+xSJyL1w/VFSFto98TKyr5NMbl9hn8RHDzOK
         z2Kg==
X-Forwarded-Encrypted: i=1; AFNElJ8aH5zJDnOIxPnbD4n4kD4xVAs4u5XKu5w76MYHQmR5UBXjoM7ScOMasgpJX5ijtxbz+5eAsGyys3tkxGYFSk5X@vger.kernel.org
X-Gm-Message-State: AOJu0YyRwzImYA2VfZpOdztJ2u1GeU+AqV715PTkJuwYII6p89PnuoYY
	upe3cM6nUMufdg+WC95mvQYg1HxUai6njh1vOxR9d6GzpmjdYYUoyHzlcxk4GvPRWKHmTaf/0LW
	wNztjpv/pSENTr5MJHceFB5J1pWp4tWmg8FQAgcQFU/xODYguxYutVil0eB2m53BjGcvzzxMZ
X-Gm-Gg: Acq92OGEYU5WRzPAydpELs7y+fpvVzTFNbYPfAU6+R5V5GUVo2iexM48jYmow9yKutV
	+K0DbpSMHrpg85cYApzepxdCtwNGRDj1VBLrTpFXws8ytwHdktPrHDXSYMNeFX7PqIAMejo294h
	3lCCfXNaddjcAJj9b1+tK6odwMnZ2f1ENcMLB6nQ2tNJXLiE5uSW6BdmmOgNtolD0Cln5yLhUCa
	awv6izX+CsTrOEEmIDEFBWBXPiZIMNPOvbhDpstA4t+cA/9J5Ol15zZ1j/fK19KpCA121j3qf3+
	/lWBtSe+gbIDeZ02TjORDk0WF5LN4WKgCOnzZpjcryX1Rg9EfZVGPIYhcw5atplzb+V0e4+rFmD
	sImnYXXIhn7VCPc7YZ59BylEjacJOS6Nir67f1IRCC64pdJXZiwGLewak
X-Received: by 2002:a17:903:1a27:b0:2bd:ef12:14d6 with SMTP id d9443c01a7336-2bea33e5a0cmr16911435ad.34.1779345025358;
        Wed, 20 May 2026 23:30:25 -0700 (PDT)
X-Received: by 2002:a17:903:1a27:b0:2bd:ef12:14d6 with SMTP id d9443c01a7336-2bea33e5a0cmr16910625ad.34.1779345024887;
        Wed, 20 May 2026 23:30:24 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.250.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c263a0fsm241748305ad.37.2026.05.20.23.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 23:30:24 -0700 (PDT)
Message-ID: <b62c2a16-9e73-47a5-8bf7-3878e21c3da7@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:00:07 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] media: qcom: Pass proper PAS ID to
 set_remote_state API
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260518072856.22790-1-sumit.garg@kernel.org>
 <20260518072856.22790-13-sumit.garg@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260518072856.22790-13-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ea682 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=X+kW/DRse7pI7A4riirJBw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Reuo-bjlSNWgIop-ackA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 9mBgCtXN8MaZE_MirUrNbgYG-yvIiu6V
X-Proofpoint-GUID: 9mBgCtXN8MaZE_MirUrNbgYG-yvIiu6V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA2MCBTYWx0ZWRfX2TCcbZBQB7/G
 p4R6NvVgboiVJXKKxO1x4LNamOyPvY+WTeFkqQ4XXJNneUa1p0EymIlG45/lR7SaA2SM+80EKR3
 KQGRtcDpQC/gdlp8Dfo7uNl2iE7rzmERkbCy5a+ZnevahC9dgAUwupvs8xwEo2xsTC18XDKLja3
 Dy/qk0Yc/D8Kb7+kbaUV3breItBFrI26WDCaq8wUHNZlL+d5C1B1lRV70+fLoRCc6QviQG9zenJ
 uuWPx29sSW4ltxKx0ba3LvScmIqjn5AicpjvtwE16drfMbxnuTWmKYsvwK5mZY7y/sIJ8Tx/OZo
 RUWa1cFZ4OQqHqkcvt4uYA9eF1nncVvXCNnPSve2aCgycjuA6TzsD+aSUqp9lWU+UXtwqnU5cM2
 ye7OFBaZb53+sASU3WfZlTJFbESA/k1R+6G5/K6obDMHauF7huVgGY2lLMuV4PRhPXYB0qNNynV
 PKh3AH+UuZEYR1owlsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210060


On 5/18/2026 12:58 PM, Sumit Garg wrote:
> From: Sumit Garg<sumit.garg@oss.qualcomm.com>
> 
> As per testing the SCM backend just ignores it while OP-TEE makes
> use of it to for proper book keeping purpose.
> 
> Reviewed-by: Mukesh Ojha<mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha<mukesh.ojha@oss.qualcomm.com> # Lemans
> Signed-off-by: Sumit Garg<sumit.garg@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
>   drivers/media/platform/qcom/venus/firmware.c     | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
