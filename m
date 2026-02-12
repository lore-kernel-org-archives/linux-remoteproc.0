Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9792D0C68
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Feb 2026 09:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770889056; cv=none; b=h2VtTIrv4YY4AzKALOGzGDftdb0UtbV+lmLT8zfrHiYOLztes0V6V8yzNsToeW5dhlHYoKNr3XcJ41vK3o7rMuL6Emdy5u3zMKzPXvud1S/zWr/hGpk45vtY6tVrsnP/eBf2EMRcCoAwNIKJYOWW4yC6xTuEhDhPDKCaLwHmlXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770889056; c=relaxed/simple;
	bh=ki4PcDve6QZIUhmtinc8MmVny6PeIIlLksXH3G43Eh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMWNWxWMtqXaBszgW3znuR+z3U2tVH2jonj0hMGhAv8Nu25fAZl9P1SFvMOh54lDarrUGpYQ9ALJ98oXHFTSPeUQnzXg7No1WTYpt/WTXJNmYWIPPoDrZovNLt1w0VaLiOWjhl4mLAN0g1RIJlpSRpJqRtgFxis6XBUi7+nLDQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/UUF9mi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGnWeVFZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/UUF9mi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGnWeVFZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3S3hE3145491
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Feb 2026 09:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ki4PcDve6QZIUhmtinc8MmVn
	y6PeIIlLksXH3G43Eh8=; b=P/UUF9mi3bO2Ck72y6Iyl4rPZMgCq8aD91iYxfan
	SAiyJ5vpjE+Q/znMzl1IgSozWIx7Y7s5SMCEA5Wr31vyYYxICUZr0198RRS9X+JL
	peK8rsgoERRT6a/4ph7rrl+s7nvxYFxyM46zFydZN8oenlSl6wDlyQmX6xrnxvN8
	qbYMEB3POYRtOii+irXxOxsJTSQQw5DzKMOLeVqOl0zAsLEggssUr8nEFTO2PqsM
	Y84YdpZu1d+sszdryJ572jcuhtQJc+PAc7K2EGKCTyEcrKhjW/J91s5zVqLdMcU4
	e2Ls8aFsw15oeQJuRsd3oqL8aTAvuGk2w/tj3/yJr8HOUg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8ukt3a4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Feb 2026 09:37:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6097ca315bso17094548a12.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Feb 2026 01:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770889054; x=1771493854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ki4PcDve6QZIUhmtinc8MmVny6PeIIlLksXH3G43Eh8=;
        b=eGnWeVFZFqLUR8bpz8tX/tKA7+KYlLVjqiLZEAZe09fErFYfv9xOZvbiu67VaHEkLI
         7Qxb4HS8jJzAPIMXOQ4dEuO/KeHBIHjaKZusucK/+7tsgBemnQYa35NE3iV1UfKzbRrH
         7G7B3FgtZWvZWMHTpUQ4eC5DLHlSWtzyESZ85DXaIeIQofo/N4/D8TQHkIxzHg6sX1YU
         /T9xph/2Plv9SMTzVMCFBGp5I5LIbKdWhq2y0BiP933XbvQcSUiLKwT+tv0IW45/7Xoc
         22rCUwrBlWQjGz9CnRLaObRtIiHfYARK+b0Zc+iy3XWSFp4O4yNYkXJa3OcRiZVi3qdP
         hV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770889054; x=1771493854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ki4PcDve6QZIUhmtinc8MmVny6PeIIlLksXH3G43Eh8=;
        b=oyVpck9G0Zee7AoOXU2TNNo9sZdwyfaT2C5ziHxuTHEBjdYkK5pspu5DJUneJ+Un0o
         pQqYkQQGAxHwTgz/1te8nqzVg/scKlRqgR5GiKTSp+wy0NAj36Jn+Mrxn3m2Oj9r9sZV
         ECwyjdxjiwWo5kyJW4zp/JpwTerv9C7LZG+3h6u3raTeCI/tWOsU7ZzgaTUqOtQ7SUTw
         UYVBv1YziMoVxsIdlSPQ8uoQQ2wpBmjz7zcOLF6fJuHkCeCOsRD6L1ih+ODN0x5b3+BU
         qs8JFuAhWO51vtNI1NPMt0MofFc4zQkuGsWo1S+stj+40wNzgVGuW6mirOuKugNUq/mE
         xptg==
X-Forwarded-Encrypted: i=1; AJvYcCWMw6zNw2Dv/kmW2AHhz4dEtI9eXxOWWYaLmFUvoOQRt1n+dp6ag6DlKnnvxSSlPq7/6t65fU9uS56KixhaThlD@vger.kernel.org
X-Gm-Message-State: AOJu0YwO9xdIS39XNnyiPL+eZpZ97PrQNLvDlpIOBgRwkvOaaAszgRJb
	LTAPD+vIv10CScfMT4k/6F6V/cJWET/C6UOcj+ymtv1LE7vrglPh2vCv2yJ8oDBnHXT2jvGeiCJ
	nMrXAHc0Lzeee+OfyuFGi0OaLI13djHqH/nsEj1wrB+0xVqccsclK9Nf09CIAZ3eVRTZ89kRo
X-Gm-Gg: AZuq6aI8VOXglmlMNDUV8pueRH/BmqrP5cTCyFxP0dkNbtH/FalKOfyvx9KKudvAauN
	Ak7JSEvDtQwVdQq4A0RkGhaC+tCLAsnnjQjK1HhCPvYsZn10/VO0W0ZMdiw5kFO97YmUn7es7E2
	SLlea7ClfYff9KVl6yruGqcVlcVKaL4DHqhdjxs0OSfa8q9Br1l1AHm0EulVtyIlQG8Erdb7VMQ
	Hp809fFbOCzbd+Pp7TicR7Tfmu+p7dOorW5laHbomYPhBiCAcnJPSU8dlWbsJPgjm5YCQ0xFuUi
	UEOWgVXCpSopZfiZ43aRGmXMgLQoMJVe4ZiJZFiooH0MNkYRrkleS/w8zk+IWp1Uss4APE0Z+FN
	5sJvACKBj2a5IJGnFsrIS+m1RMPzJSI/AyZmgSB1r3bJFFkt4EFcBiPo1dCum2vJj0ApC9890zC
	phmOlrHaEUgp5yshmStezW3RUjo7G3SnnT3rQ0CpHTZVgSeJQpRkY=
X-Received: by 2002:a05:6a00:71d0:b0:823:602:954e with SMTP id d2e1a72fcca58-824b0496766mr1736814b3a.27.1770889054071;
        Thu, 12 Feb 2026 01:37:34 -0800 (PST)
X-Received: by 2002:a05:6a00:71d0:b0:823:602:954e with SMTP id d2e1a72fcca58-824b0496766mr1736791b3a.27.1770889053639;
        Thu, 12 Feb 2026 01:37:33 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3ba784sm5368564b3a.17.2026.02.12.01.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 01:37:33 -0800 (PST)
Date: Thu, 12 Feb 2026 15:07:26 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>
Subject: Re: [PATCH v10 3/6] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
Message-ID: <aY2fVnCrPv2sS32N@hu-varada-blr.qualcomm.com>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260113092021.1887980-4-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113092021.1887980-4-varadarajan.narayanan@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3MCBTYWx0ZWRfX3vYuPB8qlB4Y
 SSZ6yngPwrHyR/wTW/N09tJhh5G+Mhck8u5j5xIfiML09J8kkBdmw7nXKcrQgwlWhcQ6naJpiAk
 W6zxjOPTl6u1fJPluCBCuzyl3Je7aEpCVozpctKJWv/yf6+OKmC3y0P7Johw8DonLR2ZkmGblAa
 VxeGV0q5vJMVUVCcs7GXVK2SjKWJXJpEsdXtzbSFkgL1Ne8iumSNrgUieYvrfJmQLponALBJ0mA
 fZksYkZYzdpuOMA6V9uPZLc5It8gYvz4YdD14CxZXjesZQsldMGO9VmYgS9CC0GuVrCsYtvpLeO
 gWtQ+eEj2BWoH7NPbtEknyYQr3yuHKRciteHCAv0iW8nCx7x9IQ6S5o6E8Vzg58jHUkOUI6oS6Y
 7nzJkSqQR3vyArx8bAw36Hesgbqf9l8pXZ2ksXVeB+e53uUknrIkmbgw6IViMkzohw5a0HsRVpB
 888aPKmoDKi4nkZChbw==
X-Proofpoint-ORIG-GUID: 5vliFgtLa3vS0sgU4vfMJlv4A5aRmF_q
X-Authority-Analysis: v=2.4 cv=INIPywvG c=1 sm=1 tr=0 ts=698d9f5e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=c5BuR5TBV9o0uT81jYIA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 5vliFgtLa3vS0sgU4vfMJlv4A5aRmF_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120070

Bjorn,

Can you please review this.

Thanks
Varada
