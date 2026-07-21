Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E73E443A8A
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 23:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675541; cv=none; b=YO6pe/yhKIJy76212SDAEw2s5J6yth8bPyoZqNxjB7iueWaGAN8EQOSubUjJM+LSpsqjLYZDpyHc2q4U8f5C28vC/IwAnKhb59M9cmwXMK/Tssppd98s4qtt5n8TR8LjWDUaaBYc9VP2NYiJpDjgDmBDJg8g4Sfz3F92hfifUoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675541; c=relaxed/simple;
	bh=Vl8rdLXA/zWODT5DG80RoiJoKnYzEvwuaitp4xFqIRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFWbAvrFdgUaewA2BuNbVGLQAeKvL7xiV5WAbKwZb3W5J9u77tg6p+XvQmAAI1LV16W5NhOTCcUAgRwsn+jFV6+xbTV7kz5sjzwAPV48aSeTpQTj8LbzaLO0qQa15mItSIjbB6z6OXcqiOmjP+X5/kvUmz9tgi75mUuPZAoD7RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCfZDsuy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZYGPZdT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCfZDsuy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZYGPZdT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZJ712934454
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 23:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPFjYsfB74/nDvbDbVrJyGiokLJKFBi2imc3uqTjMCw=; b=gCfZDsuyx8wMiPx6
	EjB1L9/DUuBEJcexYw9PgKGiBCWx0LhrRNZDnTEtr4oZxr9P3ly25ZHfHVEKxSJY
	9kK1ufSBa7LZRQmbFZwOZxxyRQvZhnQc7Q5eu+4KB5syWvGe04yqCfHBI1ObuGLA
	e9xx0GnN0cFqNfj8dPDgD45Z/lINTd9Yow4xiY1mJqireeQIxlrPKa4Gmp5J2+A9
	u//EPfo6OEc8dpgB4cNiH4U0FYq41I8WqdOzJLrtTYx12R1SLGGzos9k/52QVrVX
	iixs/rsoNEs083G2eSwF0XCNiCZAxab6sYzdfhkmEETNKBIPu0yyZ/gRwIr1hc/q
	5Phr6w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9aeamrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 23:12:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso129402851cf.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 16:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784675538; x=1785280338; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPFjYsfB74/nDvbDbVrJyGiokLJKFBi2imc3uqTjMCw=;
        b=eZYGPZdTZeUyLiFgHtkxVwwsHrQCJNQS0MfA8po9h9YZHmhI8dMwN8iWAH4nI1LCUf
         0crx3eAqsciFZtI28rdIlPCuwPQMeVI+6zbALE2QHZJySm2K4FV2TJezmKRYlrRARVwr
         1V+ZqnDllpCMKIEoJDF7EO5ZbBVKgqS9ucu9D5Puj8dM6LUraoYevqOaS2Plgji80HKc
         koCeIIAlJJIP7TVaLVEOPzofaMlWS2BOoQtRo+0s2fKCXYHZ6yYivn0i8Pz1PWk0U5Yd
         z9DNz97SN217iAI6dLD08FLbjALb2uuHKbPhWKLW8ErfaVuAgq7zULwlHzEmK5toQks+
         6MKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675538; x=1785280338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DPFjYsfB74/nDvbDbVrJyGiokLJKFBi2imc3uqTjMCw=;
        b=EPQuqxirxq/c4yD9Y85QXIbwPNnX9EPpt/i9VxTw8LKmMjZF4cJp8qJtp4kpzCGw5L
         +L8B9BntJIjPB+2ZrJc74r7cDL1NFlXtPwswLzL7pgCSQSwRQRSV5xecsqviPCbVU/lW
         JYv/nuuzxpUIERo9CwebM9y5x3q0N9QW7hoFETFQK5wIZNusd+2fZkChJP/5R+cdEn0J
         H1m49xoNnvyK0NRVq+nIO6OdY1kXJgLxKbxMqfDM48fgRQgbg7ZaXsFH1RiMYQv/Ecdw
         x0SWrjDwW6F7rZFpG4MM6mdhln/QPltGlRCfSoMlZWqzE2G3wY0pQS6jM/r4ov3koVKL
         XMLw==
X-Forwarded-Encrypted: i=1; AHgh+Rpg5caK8PgtR9bZheGqfQFBColTBRkgPAL4DRASGNWeKuuQ3ELcK535H5Weiu9ilcDHNJCATJMIqOBpMgkMOaDK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Pl1C7hncPsEUS8jUtLMkvfAfQBzZ4RGzVb6HlEe/0DTBEJlR
	/H57js6As0h95olZSqpj0izlcfDXyDRytgQFSXrYHeCeerzgihK5ViD1luKdjh8SAYR6wJqlet+
	H7Xzmf1cYFx1bDenpLaAHt6ebom6xIltge91qQ/xVmrymb1oMTqksmnI03yrdFUiDfpvI0/3n
X-Gm-Gg: AfdE7cmlzuthrQsHjwHgmKCkefKqHXBBH5oH3iCCNopoVm+4uB3q7FBqoT60/iyHaON
	pqNF5h7RFftnKxuIWpU+408rbbOc2wm8vCZxqj0m4KGfi/CIoHiqq6QC3iYmlqKhVWPS7eCGush
	DadtY0gd9PYsfGXyy5znaBgHgEFbh0O3dI7d4y1eYbvvzhiLdn89Hm3J82NCkysshIaKX+caDlc
	Lxm8Ohtj9ipaLEVJ9OIdwfqW9SGuyxIjMaNIStu8L8STNY/Wd9qGZcqBNAu/EjAdDyACWMPoVUY
	hHcmmV926weY5MRxD14MxxfhHwNu0JKyiDSx0nZDlkMNfad2w+87C/tq3rNhGSOvfT44qE7P+zx
	ul1M7rTNFA9xPQwo7ETo3KzCe9M3Ba2rF56QbWpK3qV63jTYThiBLyQNToGxqt/EnoGxLFq4ADG
	UvEWBwNaYs/T5rcw==
X-Received: by 2002:ac8:7dd4:0:b0:519:f884:b587 with SMTP id d75a77b69052e-5213ab6d3a9mr195185131cf.27.1784675537737;
        Tue, 21 Jul 2026 16:12:17 -0700 (PDT)
X-Received: by 2002:ac8:7dd4:0:b0:519:f884:b587 with SMTP id d75a77b69052e-5213ab6d3a9mr195184921cf.27.1784675537347;
        Tue, 21 Jul 2026 16:12:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68b7425sm1387111fa.11.2026.07.21.16.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:12:15 -0700 (PDT)
Date: Wed, 22 Jul 2026 02:12:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v5 6/9] arm64: dts: qcom: lemans: Enable CDSP cooling
Message-ID: <mi4irfwanrjjv56p62nn352yinzzxuig56amv3xkpkscwlrywl@pst3udv3kpth>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-6-99620e07f505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-b4-qmi-tmd-v5-6-99620e07f505@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sA2w1s4HRNSr8ySxsJSkj1NTQxz4MctY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfX1HBlByT7r60N
 FVdJJkvEfMogVcLej0CHUk3tO0WcfkmnJ+yImQQLM6DiAdBDWd+B8pmxxqNzgrN3OG/9FKlqXcC
 l5907PbCQ1u6qZcHALjaTamawtAb7Fk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzOSBTYWx0ZWRfXwDBnqFt1DoMq
 ADmTwdfYyksQqZYKL9TrxMsr7x1JE+lMF/98jhEVRjmRaphwSrfZZHiVY12rbfDeDvrVhNHdlW4
 1l04kmP0k40l0Z+h4ewu5CGR+jtL5eey4WZ494tGpjb/jsL1+Bb72XsbbrxTjiweYbN8eomqsD4
 AlQMn8y2XoctVzNFXUoe1aMBD+A2cHdZDacItyUMo+9gqYzCc3gMdWt3Ac9yTX92XyKwOT+s+lX
 2p9Tmz0d6o0FcUh0zm1H54eMJzKTYRDPwnRSgyB+LyxmK3//mFZr+PqcmJq8YzQqPgNF2DoELjz
 t+i1q9H5TnH2ALFAsosx3ty2Rux++RHcMTl10tiUEeE/YNlfi/vk6f3Us6WPxlHHGSk5UVqhPws
 00XfqdB2E1n1hwf+LOBie/uyDnpG/b7/dYT+EtkssgwHIVvLBBqZN2T+xjHAdIGKS+nFTSH+wjz
 Z80XPQVHLo3GqnDU87A==
X-Proofpoint-GUID: sA2w1s4HRNSr8ySxsJSkj1NTQxz4MctY
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5ffcd2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ysZNT-AePBnC6ZdsTwIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210239

On Tue, Jul 21, 2026 at 11:59:03AM +0530, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in lemans.
> 
> Set up CDSP cooling for both instances by throttling the cdsp, when
> it reaches 105°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 125 +++++++++++++++++++++++++++++++----
>  1 file changed, 113 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
