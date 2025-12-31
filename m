Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0500313E2E
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Dec 2025 12:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184416; cv=none; b=cgmkFLrvANCAztCMR92U19bAYKiIeNKmkSoAvR6dk6yZ4PfeKWhJD2a3zVIxiSupCdB+iqGaV8rTiwZv9deo15U5Ci1kUMkGB1TOVmj5CQL01+Bl1Q8Iw64XQCXmfmwjTSzRBaCJRRzhcW6wGiP6p+RkVeTy2ccvYA9383Nxu5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184416; c=relaxed/simple;
	bh=IJuNNcXQtCp3nWgFBNBZvFfjG9949BV8pSdjzRkGGIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f8ShFiy+3IGBlT0iAfxZ64/5kkxKMPHZYA4GSKzRar/dwdab+uHnAmcACmbNNOSCsbWP9h8h2cKlpzOSuHRBUfigJHS0TpUGVvXbln9qC3lqS9ZFpSmXkWaAqCyc+4JcYseu7ytSmGatNozGS7ogdXQqRcoJhhVqZbjQWUNJqZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSfNnQPb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZIHIAwI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSfNnQPb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZIHIAwI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV4kX2t1914320
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Dec 2025 12:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BuHoVQkLv6FjRX5V9FVHX/pNuysZe3i1za9/ao1aTNc=; b=aSfNnQPbqqPKmg1J
	OHhiWz7qReNg4idkG+p3pIbD7Nj4QDTI0dHa9b57WbKP1MnzbCvFHiNz8/MNvRw3
	PTL3oLQZpy7ATvud6QRDLIgYTiZ9VRJXpZ8Y8y152X2qQ71J/2jAr1a1sa8W6Hd3
	GYpWAC0aAOBjv6vD6/qwUi7fjut9sWf4ut4vQFAWUkPA5SSiBEIu+mvPoKdQ6n5g
	jvPRGQylnq4bReZawBrJBmcDZi/i+GGdYvXjHsbVvLK/1RKs30o060xt4yD/GrRS
	DWbLC8NUym+X1lgJDODvkEqXtnoBzyD/Esq04UxBZnzF3hbRVbY25kgpaazCoP7x
	tlYyWQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcdky2njr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Dec 2025 12:33:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee05927208so47773041cf.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 31 Dec 2025 04:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767184412; x=1767789212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BuHoVQkLv6FjRX5V9FVHX/pNuysZe3i1za9/ao1aTNc=;
        b=CZIHIAwIE8Fzk14HqijYff0x/eOWk6Pz0hYcrLZmQKHS2MOwvFuWxsGVFUW/Mk8t/x
         +92G4JeJgaOANlDoGqXtov3BdYfU/73dHRneSTkqm2V4mU4BlyTGHFBmpZ4pO9UrZnxZ
         f21XjpPF3KCAwA7NrrWWiKh1KDmXS7tDuV1C16a6gUdOR9qkccWWAc3lCWU/WUC+ZerT
         5qdfNYWmxxuryjbpxWuNK85rC6cwpU4mhV6Y12zF3i9uNPMS/4HhAxIwyaBG9G1qJrpM
         r0VESumepTVIwkfUXwip8yk+109aYTWHRgF0KhvOtJ0Wns0TKJ5U0zs9NzYZuzZknujW
         htww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767184412; x=1767789212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BuHoVQkLv6FjRX5V9FVHX/pNuysZe3i1za9/ao1aTNc=;
        b=wIwraZa598NTvl83Uu2sYADTMWU0AHUxFv2Pervgq0pKHfgzEP6RY2ZECYcGfYNXwg
         mverrAUMty7foqJNnMQdWIqkCR/fXbeTfCIaimhvIhP3RuO3UFO/MsinyuvoZSUSuLeu
         gUQlFe92gUjrW+RgdbGt/V2MUHKX41/WK+KbwM8PN+rtiYbrZDEHYRsnRccQkYQ2xTZO
         Pzb16zOcYfAjF9XapMcko/ruWNGX9Qr6HGpo4zAT8JPSRDPR8fkF2NVSD7PfG7nHRtMQ
         POGvDEzghQNknjLdd1SoaHHWLHjlo1Uo92C/ZxUZ4axafIBz6ZBU8T9d4NHkco3aHAiZ
         /LFw==
X-Forwarded-Encrypted: i=1; AJvYcCUOnVVIsmbLNy51pWwplWGAvjmEzxb39vJsLrkD7mGrAFl4iAOTyi3iDhy9gbCaNC0UIOiUjVrTqWvA7JltLKUC@vger.kernel.org
X-Gm-Message-State: AOJu0YxXC8XqBHsFymyZkjkhJeeN1RQ5Ph0UhX8idCT+MFVjr2Cz/IWi
	iaXxsNkjsSms4HSrTmhJnCbKCX41NxFmBlsA1YBNVHQMoavPcqavtnRr9QZeXPP7fTfIh0YXF8K
	vEzOPdxp4o1S6Ql31qOfgKXVWeNThfcx1O6jHHA3ELSssI7+/gx7wfP75EbOo/uqw2DwkGBtK
X-Gm-Gg: AY/fxX6A75cV5jDw5fp6DD3Kn71NWkTcXrEuw4HeDgKM4b+YkGOZlUawquo+14fzP82
	dwFc6AlDVu+dovdd6eqcQzHnldyY6NAtBObJJogDOv4mTDA5Pl4UgPB1rT4L8zl66IS6KThAyEb
	lnIpxJ+M6Rk/CJC2aGmIwZkmBiuEesz5a+BnRP/pcXcqM8FZmq70RLR8GS4a55EQk7A4TKzv+JL
	v4O4o/A5GEC3psCbA3P+9UWK8/BLu32G/2PSXFqt7USw+cRBc2g2wD3RmbB5I6X4k8ZZbdNa4t9
	ArTh7fM+X4Acznt0ZI3on7GtoMzQV0JhC2+ZegapA9wnD6b0puHr9++Ly1/45ICqV0HomF2v4SM
	KI7CeFO8kNKaxwWfhimFDjI+cfJgeebSdr2XN9cpaFqeOcsal6ERz73yBkL2YmB5knw==
X-Received: by 2002:a05:622a:1982:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f4abcee273mr398303081cf.3.1767184411915;
        Wed, 31 Dec 2025 04:33:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4iUtNZCuxzLi07y4rX7yABbLeLKjRx5DG/JGT9DBtlNSGBgbHzwP5SNuS/sh+/KaomXp96Q==
X-Received: by 2002:a05:622a:1982:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f4abcee273mr398302731cf.3.1767184411429;
        Wed, 31 Dec 2025 04:33:31 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91599605sm37604599a12.23.2025.12.31.04.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:33:30 -0800 (PST)
Message-ID: <d9581e89-6e64-4450-bb65-d4ac836e943e@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:33:29 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>
References: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
 <20251219031010.2919875-7-varadarajan.narayanan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219031010.2919875-7-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOSBTYWx0ZWRfX3P4UA+OIgNHF
 cEqU2/yxkfElICwwOMrdxxztWhmWe4cwdNewnjbzUlsUe0bfA6/Pn+tcKna/X0l7sGrkeTvnX2Q
 pvlWzKm07YTKflCy7a/98NFKmivapCspTYeEj3zKVf4xYykjGU7yQ4qBPK7jhyq5pTnkDWSdDxN
 0A5Fqch8H9wGcxKVmLN5MBPeo3Oc9qLWXxRQbVB20aznxlPigN3OHiHnLMHMevOSmdX6nHdTTXq
 xjra4WzWTQQon1q0y7TqXJVpo2wU//DPIBOz4namWNLU5tSg4aTJUznAcrifFqZpoAeVnSf9+SP
 3AA5FVnd2N8NX+uJZgSvyxulMd6DXC/9HFUTk+DO2hyHPsSdZe9LFZuBRoKo0T5rfCN9LXRcJUS
 UW1EagysqiIbokW542xOa0JaitDgTn+xgeCE8CKwmHrzTYc9qU+GAKmmXhXwBt3+OklHBJkpbDz
 pmYnRi40ZxVtoracKSg==
X-Authority-Analysis: v=2.4 cv=Wskm8Nfv c=1 sm=1 tr=0 ts=6955181d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8
 a=s3MJbU7F5wKsRGJXuN0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nLbWcPfnIOTfT42KzOWg-iUhsX7olSf1
X-Proofpoint-ORIG-GUID: nLbWcPfnIOTfT42KzOWg-iUhsX7olSf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310109

On 12/19/25 4:10 AM, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
