Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230601;
	b=qsiYEjtbSPOs+0OoZ3Ro7NcqY64XbQ6+257mBG4OQCS0O+biUCynnG+qNMnhuaWO28c3
	 p8d5myvnQZlLKo22Suab2WbYx9WV7bYZFv6r8z4VuxiyvKl23IPzS8sy1PxYM1flacuR6
	 oz82ukjoI1VRHLd1UeWQxI6Fp896rHcAAW20yQOGomMPQxVnYklUgGwluOCc/42Qvzrw0
	 K2NGyEViQld72DRoFnicLgNmimblQZSdjWTpLXTwcTIugyKZCbx9N+vZLz/TFkc3Q5L3g
	 wOsLXSY0aJZnPxHV5GHEvHQYngX9mGOVfL+svYYJsGbZcCcb3qxgaBym9Ij69Zy191A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230601;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lbt46Oqpg1ZLS/VcZjd1HdGRLm5V87JoUpPsXVAcBYE=;
	b=l5u1YJbje8t0GeU7W/99krCOkmfMkp2SINI1uYhg/LD9/qpG4BvCRVq/e+P3aMnz/qRJ
	 HDEEd+Wijt47APjPLekYs2uVmQw7/hC2qgX7iXSqOFCVZYuubLoaNyQl4GLcKY6CPfW0V
	 zcsGSsJZRY1NUbrMFp1RO4NWta8GxoquKdomef58mTC27igcBuGP06nTWJcV8ZEAYR/LZ
	 6hya+ijYqu9D2qdIo4D/HlMk5JqZ2N0SpLMhAw/DqDOTncdpFIvR+3AOmT8WZAd0kRk6O
	 RtuLk+wviyWvGmNjMtJEOe8KKodaIsn7XGzz1y7KoF41U8Uy6TBaf3X9ACrPas5CkTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="M/BIXBsg";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hZmAcvBx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80284606A323
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 13:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80284606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M/BIXBsg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hZmAcvBx
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEsG7336362
	for <linux-remoteproc@vger.kernel.org>; Mon, 9 Nov 2026 13:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lbt46Oqpg1ZLS/VcZjd1HdGRLm5V87JoUpPsXVAcBYE=; b=M/BIXBsg82eDIWDu
	Gtjk8+TSKT+Brp662poczEHYVOPsSTrobjMTy5g9eNMJqw4WUOrZ95XdSOamrBLf
	pjVfaaI7YtwzV0cMkBuWshkZiJKyoTO03T+LGzXGunjapX7bStCWZSMyevAMzh7/
	m9wuAEgpxH0Eo47hRcbLDi8bXdcqV2UvdqhACdo+KHYFjnY+1kIXWPKCD8t4+B5Z
	Dsuf3lkO/mkUcpfDeqCPRJHxjPKDSwAZrpspFw9Qm4vqTBkWrQ8YuXDAaObeRJ7K
	0PDxhkF18LuJQfooaE3KEj4kNFRgz1PAxOv3Z+kf1jrs6/AnhswMCakqyDX6OiVo
	q6+YNA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rfkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2026 13:23:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-77f133855b9so17267137.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2026 05:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794230600; x=1794835400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lbt46Oqpg1ZLS/VcZjd1HdGRLm5V87JoUpPsXVAcBYE=;
        b=hZmAcvBxaqluH1Np1+5BLk8BnE01+KIJyLulyErXoha47DA3nLZreZi0QJ0D7TUUs2
         motAuNtRxB727rfhVtn2Jtbh2FJO2FTlsZlp+0yv1dtczNgYXT1Hu45zQ+qLtRaf1MkK
         aV3mToIOXi8Fl9UE1bN4R3AURZS9VBTOUoRSEc2RNBKcpf0ohOQk7aBdasZYUjmKXy1F
         8I/RcBz3gY6pKZqADStYP+50V4cgWyT5tXCYd47Sm3CtfH+Cvf2bFwpUNPJOkU0DNC4k
         iOwOVoDis4m8KQdDt4x7hxTTvT8SPiULA1Kb/ajsdIzwHXNmR3Lesop9pjVf7mclsotQ
         xvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230600; x=1794835400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbt46Oqpg1ZLS/VcZjd1HdGRLm5V87JoUpPsXVAcBYE=;
        b=isHbAn+RpxrohR6HbdmmohCcSI5S3oo1t+t12YbElcuHmTzc/5FiQNV35Ycsc0xA1d
         /+tY36H1329MxuejOVrCmHIucv2S8t/ifjvTlGZ8KfEudz1zQ4g1iNR+p7H79ixiol0h
         9Np2yRuWNYvQEKRncKMnS9wTlH7aoMQCB8+kYoQdCBL0Lg9Hhp9wMS1Ur0T3zPM0HaId
         doLo6LC3gmQuzYmfjdly9L2E4ah/YYtjt0ljsAMZ23Gx9SfGSZt4ELOW6KTuKYrCk1tf
         HTzdliDVwtZEVFMSD7Dqtrcoz+6Da+KvenbIzCkpzGZNdF/DvoLCEdtajdwcHevnb8QW
         p3rw==
X-Forwarded-Encrypted: i=1; AL+hErGlgyfX+AQzn6+CK/rIbouZoTedeqxR3lDTRHzO9h7qCjJEFo2hW3RRrqNti3TRc3RWeS1tjJ6RSOcGHVmAoSnL@vger.kernel.org
X-Gm-Message-State: APuU4Z9NGixJUL1ilTRMwOt+ajdGKMTtfm8onvziDB7S3qYrivSmU3VV
	RmImTNU8L6TMhxKtWD2gtY13UGX1o1FuPPgmDQZUu3QbXiMQjbVXTWi+QdQYRoRuxlrAtVdPWuR
	WV/sLSsUQpjJg4UEjHKTPu8JCtPxcHWiYM+gxpSD+g5rzs07QHEAKQ2erFPDAIWFU2mbCDbf3
X-Gm-Gg: AYBFou1EnRJPD7MiWyeWZT/UdNZsismBotSNCnKOKOeSMZzUJKbPZG0MhLyqzIsj/D8
	99qnniN5i6NcIg/bkt5TVgqyr2e4SO8UG1C4Ld1cdcPCkJTg5RhysYGoBSNnmIJpZufka1pswWL
	KLSGauJq8v5qf5emRsX4fXVYM1RdeYC1L+YbTga4Sgv9wc4jwdipuwNS8ZVmNo0/cDTjqAtzcZo
	osQhpOhULKrbJ9wyUlhM81rqtXnk/xzR/e2ZESbw+fcj0BtwI7y/Rcbpz6DzkVESs0A1ExStBET
	wCvneICGrglsIu8kAEpyY0/tL52NewZWEYmySbW6s9sHIeSJj185FUfgpmlnuLwV2LBd6QFKheS
	WvL0a6VRZ/SNwYsfFoI43qgNR1LHQD57Y1uH+jB1qGMIduhj89g+nnSMrzHaxTSQjrsbZIA==
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr841106e0c.1.1794230599667;
        Mon, 09 Nov 2026 05:23:19 -0800 (PST)
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr841100e0c.1.1794230599135;
        Mon, 09 Nov 2026 05:23:19 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4acc0esm165261366b.49.2026.11.09.05.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:23:18 -0800 (PST)
Message-ID: <18dee813-d4db-49c5-9ffa-7a150747a4b5@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:23:15 +0100
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
Subject: Re: [PATCH v3 0/9] ADSP for SDM670 and sound on Google Pixel 3a
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20261107022453.159341-1-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfXxWOg2WXWqWCZ
 4rYKeJBmbGv7+GqteP0xX7Co6fM1LBDYdgR4tfnDZAkPWYE6s1VWL9ODQl7aYbW+83j0y+0takV
 hrwLSvE4+xO6jLU3lxxye+LSuu+8QyY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX677gEsDtAz7g
 nXINBjo1QhPRA/n3Pg/swzoTNWbHDuMmvIs1SaqO793q1kFb/FvKVhc++EepM7C1BX/bb1ZT1ky
 QZ2wtFaLIr/VXzkeSkSNIn+LE0+9p1oEjqU2EOIan7RtIIBj3cHY2FhH8Pk4vJA9WDof4wsGI6H
 qvFhclV6WTyOzIQhI6fEhqOsgVyRaJLDQ/MZxxGYNxRW3eRmN61nrNWtuvxb5uUc0y7XgjRMBmJ
 zx70dC063TP2mM254tpQT6ydWURty6M6Hq6NKeKEKyomb/8xwZTTNysz/FaRWG+2ttSsDggRgnB
 l2PEEM+R+Y9uvkojAvH2HnYEBD4zAbBRQQldeA8Rw7mh1P0LwZU4+baBLgLomz6e+oGVwtswAKB
 L0UGbtrQ1jHhkjyL+NI4ftPSjAEJ1Jx7FGSqFvwikyVv6MMoV8UP5CsSraM3++3nHFl1v4KwEGf
 st3f+zob8mGkW6mrkSA==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1c948 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=d1-rQg67RIlivpgk:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Fgcgf8ka6cmR_l9moMMA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: K-upFx0nOVytx_4QnmQXmfXuBlcp5Hud
X-Proofpoint-GUID: K-upFx0nOVytx_4QnmQXmfXuBlcp5Hud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090053

On 11/7/26 3:24 AM, Richard Acayan wrote:
> This series adds a user for the SDM660 sound support code [1]. It also
> adds the ADSP remoteproc for SDM670.
> 
> [1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com
> 
> Changes since v2 (https://lore.kernel.org/r/20261003175659.23536-1-mailingradian@gmail.com):
> - stop using fallback compatible and add lcx power domain (3-5/9)

Can you share the output of `cat /sys/kernel/debug/cmd-db`?
The SoC also has a LMX domain, which downstream seems not to wire
up to the DSP for some reason.

Konrad
