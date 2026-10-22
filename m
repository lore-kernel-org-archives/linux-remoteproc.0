Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660697;
	b=f9cxe3i7KTVWmy7SgPwdQdlg/wv9FHvuEeKDLn0yPiuHwbMuLm1RyokIQVs5h0nPXOA7
	 3E8IHCr6TFbS4IQV7/AjRKQuT4xCfhir+l//yXaJhQHpTEd8sLYuDvmTyr7aEJJXs6Vba
	 TkdRC8NICKK/U3zNvPIP+/08FQT2MGVXdCRr6tpz7DvX9LP1EFbdLvnhkttN85UJulTd/
	 qYm5gegt/41u994WUepZCDpreOZ3f6i0cJuykkEo6+XX6+0P27omyUqj8GON8jST3bxwg
	 1tG9VJ9/LT+m+Y9qjjqvkigm/LmQV5YrDLrmxenVLvOehupr/Cz3ojOXw+NL/+PnyiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660697;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=749+aDeQ/ZlTlRoYy1DcYQ+Op5jDghh6/V2zXfQ3V8c=;
	b=4BxGBoLk3sE+VaOPS2JFRR24sla0Od9Jwuw7se1dxlDrvsXYHbx/NWa2CAJjEV6wS+P+
	 F7AEP59GhSRgxPHIj0nTgnC2qL1zVxUI+PgYNPLrOXKX2lrf8ZBOZiT/mDO7GnccP+QOb
	 sG059DZ82FUczq+8KBfBj5ha7eX0K+3iLDc+1GOURHBSwktQpxfNniJsEReGbU14g7jLf
	 XCjggAePBimFm/9UBCQfZOqzdpoMLSOVCbhHq9wKIanvYOiTS41o1Mt83Y2B0UZ6XCwtq
	 LhJO6DLIsHL9CTuUvoAYiL9VeEiiweGprXfwve69VnvUEUlDdV1FM4NX0f6OO0jI+Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OLcLFIMy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adFFD+aG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06320606A319
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 09:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06320606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OLcLFIMy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adFFD+aG
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7055T1995965
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 09:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	749+aDeQ/ZlTlRoYy1DcYQ+Op5jDghh6/V2zXfQ3V8c=; b=OLcLFIMykHoQV4I6
	CfMEVtii2eDc14lG9rp6YB+ThfuEw2Gy1krKAUtqGdRVLfBXVgM1evisFtdLtvX3
	7/ykdGjH5dSdKgNQg9aiar9wSgNzSwtmTmWJvQoW6HbANaY4wHvABxNm7lfd/TOQ
	Tjz9Mmqsr3zerHv/Jb3JNmIycVfuvgi1W+Qr2uOPpEbMe/fD9qZTzmLWIzS4ydzX
	Qse6Zn8bL1aTJ0hRk9b/Udt2+asfFJNH5vrNJ/VIZYbJLS+1D7jxW1Sq6A+zzN1P
	poHLBdl+DhH/BqRYDAV6FRdZxZxJOG/1i9Bt917UgRh4FE47DEM5JFG22wgex+K8
	oktkJw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsmew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 09:18:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso42216185a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 02:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660695; x=1793265495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=749+aDeQ/ZlTlRoYy1DcYQ+Op5jDghh6/V2zXfQ3V8c=;
        b=adFFD+aGejmu2iZcLQZ7oWPqFT3J7J1xTCpMZlouJsEu8m8JyhH2/g1rKcyolVR2Jw
         lFH85OBxxEqAeGUx4426L0TlR4oz/6eNWkQWjBAvl2Jl3ZvctNHFmZyl3ofCbVAlOcbS
         ++LxnKvyMO3Uhmgxrz340hkikSobH7aexj4axzFE5y3tNevBFqzRVDxYH3rLja9V/oYw
         vFB/6++BlGR8hvsW5qsp3/UuW71wENzgLhMDIkoyR2cQUA1tUXBeE6Wh2YU9HBkQte2i
         wJUgs5g2M7uGbIkYVYpqnRY2FYUqZ/oC3rTOA7GN2ZnRPKu1AFD8vRxAtP16uTDEJtMd
         4pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660695; x=1793265495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=749+aDeQ/ZlTlRoYy1DcYQ+Op5jDghh6/V2zXfQ3V8c=;
        b=uPXL+YkvSqbMXqGp27abDKviX79F++qq2kl490NzSWqi95BfL5iai4B5bzEsURfNT6
         c4CnzX4pK686xdb0MtfGMHLcJ8we1KctB45Xef9AITgcBGiUlCrZvmQCfO3FsziLmfJ2
         mhQFP/AqNVqQkunAbYBa2IdZejSlTPp7Rw602sLIrW/wxJ4qNCFA0HaOuzNN85ijC9QI
         COS4nBh25hZQjy13/cfG+ISqYr04GvtZSFYZLJwc0moU8CzmCjwChyZ8eoLBkVarC3bz
         oar28pPYXMxZaH0ekbAOZOLSzobhVD9TY1K94FH+ubVX7WtdQq3gz3bRG4BhzggJkIz+
         wlWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwybKBjfn/Xqvvk7/i4/USfWKkJnFDmtmyWXZ6IiQFFI1a7UqiiyXmFOUv9o6kA5pxA3tqsC45tGrubCwC+hf0S@vger.kernel.org
X-Gm-Message-State: AFq9FYLoRz+Bf85oUHPm7WigJqz/f9VaeD8qaD/w0XgX0SMIBrm5V6ds
	Mtug4tuyzsG+Wk4coisPszDLhGgkVvJfrOjmT3yASbtKL6GFlzkDtqzRby/8BHD2rVxlxHsFGq1
	4ezNMuu+jG6ppgZjlzWysO/rw+WXWrTRDvZFNjKzgHhNUTbfYtirjf+gof32XUYA2S6MsQMuQ
X-Gm-Gg: AYBFou3MzfVdrFnuixkMq0cEwDzWwoOTQ7QelremNmsTvPC4ee8Mb7syi16mz5I+2P2
	UDLi1TpXWYdL0JLo4mgMFKoBwRdqdp5Dn6uG7rpj1vflUJ7MCzshAD9cD+Bfw+28tt9O5y62JFY
	kKqWdYYS3MDgUMvPFQwQI7LC/YWOUx6+DytSlYBEoPAG2dZlPVuw1kBO/zwe08dbQwIpJyfT9h8
	lpNythc6Cu9V1D7wUTwkC2B6a7IFCLX8kIXpvU9s7ov53Rr+ccSuBobRdLtaHwkdY6kQluVBvTi
	pRd3CtfZpQjnkBPs2nla6ZPcPl38cN6VeLaCkrWMJ7d1SkPplp4pthvyhr6iyPm+hzuxz7OXSRq
	33u83bx6Gq5KAx9TRjs9zGg==
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr1016265185a.6.1792660695069;
        Thu, 22 Oct 2026 02:18:15 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr1016262385a.6.1792660694557;
        Thu, 22 Oct 2026 02:18:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1eecbcsm86476966b.7.2026.10.22.02.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:18:13 -0700 (PDT)
Message-ID: <57720aa4-4e46-4406-be78-06084b55b086@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:18:11 +0200
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support
 for SOCCP on Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com>
 <20261014-soccp_driver_dtbinding-v2-2-09d9c1378e9e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-soccp_driver_dtbinding-v2-2-09d9c1378e9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OR9ZfyAcxxpHqc-mJB5O3CRedCwi5ZAy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX1C8RmsokaAVS
 USa/fBjq6ZF3weI212d5VNjD0N2rnkzsfK2HlQlgezsVzni1S3KS95jpqHp9x2h6xHgKe7yfMtg
 euUd7ox0ncz6I9gUkOFcBNncNHB+LtI=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9d4d7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5PJkfhtApdRqCJaq0lEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: OR9ZfyAcxxpHqc-mJB5O3CRedCwi5ZAy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX8Ad3RJt/p7QR
 FYYPQ1qBGEBlxv38WCrWBAsN95LP0b6k3scviSCfzeENzSIsCF4D+SL/yOx05FZU/vZc5u4XjCP
 zOj/CFXMLs5t3hNaU4K298QK1qM/pmKrZ9ujrpvR4XrbLcCHh2zZ0GEMmou+nY+Bg055C6bQP0n
 WOGrz4Zmqw1tSsRBZPSL8pXNvMtWCiXWQk2PtQpMrqHjm8q+DLLDnCdMORJpKnLu/Ja/ADg0RO5
 YpDNTng/NVuNhJeDx4VUJAIffVE+WtGxZtvaun36Tg543TW3UEcOOhMVfXOk+FyYSk0KQ2m2urw
 I9IsmdG76UG0ECZSIw/B4EQgx9j9cNmXsB6TnbCMofaa7DpqYikcw/m0R2yqtLdt4Mdm7vikcSN
 5MtUav2ab6Y7dmlAQlq0PlGG40L9ftICi96QbU9DaWZ0GhEqLsv8UgZnzZLFVxTn8GhYzV13HpF
 UIxcJoc/N6NY6wT2n7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 10/14/26 1:46 PM, Anurag Pateriya wrote:
> The SoC Control Processor (SoCCP) is a dedicated control processor
> that handles hardware fencing for display and other use cases on
> Nord based devices. For Nord, SoCCP firmware ships without a
> separate SoCCP devicetree image. Therefore, it takes a single
> firmware-name and memory-region.
> Add support for SoCCP PAS loader on Nord platform.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
