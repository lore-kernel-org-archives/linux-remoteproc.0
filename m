Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454DE1E521B
	for <linux-remoteproc@vger.kernel.org>; Thu,  7 Aug 2025 17:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754587120; cv=none; b=EZy7poIgw9u5rGlOOlAlFXZ90CNacEuzsZ0lq4iHl4Qkn93mDJ0DAN+rkY04KY8j3UiecL1qgFNb7A1zw3/j5g1vpxuNRlu3nwPpKkd/uuL3FtN1/7FQ7jPPhBYSkQrdTf9rFkcw/3s1hfp+/NZ1dH1qAHOlyhUj3bz4SBeSDtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754587120; c=relaxed/simple;
	bh=ix4wfzIRuANwVsXaP/80+i/iUtqcmQAOhg9cFDtjiV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XL9MVKfzIJ90X5RBFhB9TSQwl/ljVVQMW3arrpnUhCBKpkOM7DL7nk+dq2BvaN6JNeQR5mjhd72WKXbb5xN5SeTk44Yen50lFU1Csx8WN7+DtJfIplZUlxuC1sxaI3GC80p+RA061neGQmpZs3ljoInpg/jS4J/8cGzKM2aKhCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz6yMIvr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bz6yMIvr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DD5F022732
	for <linux-remoteproc@vger.kernel.org>; Thu, 7 Aug 2025 17:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nLC8GBJ52JS4DT8cnivnM/XJofTs0u4QYcTbqVdpwM0=; b=bz6yMIvrF9kz4XD5
	JXh1ZKRAyPHsw7ms/x/AUct7v/ZICwoDIGWBEoXLH+y3rHmxk0r2ynysiQgGvbK5
	M1NeeLuLYhvy6mhM3394k5ccr3MZ6tgu54fwlz1o+LVJbRoRdvMbRq4zz2hqrQXc
	Klmc41t1EACwREobXBIWgMsIqpIb2TI4id8u3aWiwszLy8ISiEzfp3e2gSL2xCN1
	SlryyDV+M26I+zlwStMSAxdGM4AG8wsFy8c9HS18M+Z4ZGYqD/xyoMy0z0TQ+j7o
	mhIRzysGp+bw0kpmFtT5fTjzrl5jsOVQvzLOOdXJIzeEYIkATxpAVsyK9rYrtHr2
	ij5G1w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cs5n9c8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 07 Aug 2025 17:18:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31f322718faso995470a91.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Aug 2025 10:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754587116; x=1755191916;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nLC8GBJ52JS4DT8cnivnM/XJofTs0u4QYcTbqVdpwM0=;
        b=Afad8ZVxcs4hlh1sM/wnAtgQPPYjF4D2U/kIaUE4f2m7JLYBwGkSvNitxwgBGoifQ8
         bMre7o76S8P1p2KVPtzqF7MBDzhVAVCy0qZasaZDyhVekcENvJdSNRKIXHMgV+iCyc5I
         6wkuV/5HEIIgoIDTZFfO5azdGBiAhgw3v3L3eHwFwvznG7jRdPyXQxl2v0daDDuAh9F1
         QUZwlKVf0n7W7WvJU4POBsK/VQedh7cQPC+lIG6m3Z7tjmTqyu0KglbHXhVNj7iXjvwf
         rJ2x2vblJXXHP9khSS/wc4iZbAVHJDhG1dGc1REf7O1qoOXJBijvkMJUKW6CbRiZ/FFv
         WPWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLZaWp1IqSW5yZW3wUkFY75C4A0mPHEuI2uHKnQw3mGzk6MmKOj6C7oFgXeXLxWLjLRCqIDjBosvDVzakJxgNE@vger.kernel.org
X-Gm-Message-State: AOJu0YwFXeUr+wH4bi4UgtS41OPPk8rG6A/BkJvsz1FBmM04O0RLBE+L
	KllH/NcZqhXIZqUWxOtuNs9b+VzlW8SoA4wa93YVN48ONRsRLIUMqYGO7gIZlH/VQC6Fw+PED0o
	t3JpA+4+2ijqmNHO8YKS0eH+ctqf72/zuh6BNCcyj8JTnz9E80SLyEGcBX3mRfG1vU52DHuCw
X-Gm-Gg: ASbGncvsyR7nIdRqx37OF97MPM7vOVnegV3AqwAtGCKgKa9LYsGU6aRAhukF7rBo5Y9
	aba2BPkeb9GSP9U6vCes+ucV69WNgSq16egWq1d5dQhCPAb4WzaUWT9SFPvZHa/2CzGEfGtAJ93
	ky+jR2fcg5v39HO/NUmzO8WzY5dZZzASwZKXBcd7pGhZbxXWI9e6InlFpj0b/CD2PA61Co1zexL
	JCOnX17sTKAoa52zMCOASLB4lm4UtsDqd0S/ejUyqBks0XGplDBKzi+hck7rf6QBBnW+9pILC0/
	1WnKDheb9Wiz8hiNPAUT1nMoklQaqjmHsE5MwwQ306XJoKxGY2buiVifhXtdLE0XR2naCFwc8Ux
	j4UHuJeyjHvpW5oA9FRw=
X-Received: by 2002:a17:90b:3806:b0:311:d05c:936 with SMTP id 98e67ed59e1d1-32166ca78dbmr12228077a91.17.1754587116444;
        Thu, 07 Aug 2025 10:18:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDSBIxZMtyLHjJ8ZZPSYmQQchctU93wo3YtjIAb6ci0mllkfGZXT4TLleL1LzuppQ6KSZiwg==
X-Received: by 2002:a17:90b:3806:b0:311:d05c:936 with SMTP id 98e67ed59e1d1-32166ca78dbmr12228044a91.17.1754587116004;
        Thu, 07 Aug 2025 10:18:36 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216129c8cfsm6088656a91.34.2025.08.07.10.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 10:18:35 -0700 (PDT)
Message-ID: <9b1f4ea5-2948-4807-a4d2-0efe7b672a4d@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 10:18:33 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 3/3] soc: qcom: mdt_loader: Remove unused parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
 <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q+XS452a c=1 sm=1 tr=0 ts=6894dfed cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NyTICe1PHtTOfF-B13wA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Gcq7Z09bQKuHg1NcC_bSZxszB35A3QrY
X-Proofpoint-ORIG-GUID: Gcq7Z09bQKuHg1NcC_bSZxszB35A3QrY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA2OSBTYWx0ZWRfX0YMUZL3iNUxO
 kz4EUqByJYyRzCWypsQfVZUSWiwSmgOnO9MaSlN5tMA2tjAR0JJD/XilXPNy8D8KDw4vWAkiRht
 dkpG4ZA7eExTLL5427ANEPfwM2zibjwNZvl+jvNDMC1aPBY4bREAdo8SW+YLi9H96kJSQXAYJvC
 VrCLZ/L3k7KB6qvPuejr9AQApNk3rK4TKLlKRWuZwG3ZuSlhc3lYDZOAomW4cEqosG6xXD8mTFd
 tDFsBgD2IKxyAo5anHtu3CiikU16DdmMUDyC3XAHe9ttxwkIKZOZhmRP7m9+n/r4NGQWnSwVCzo
 0Atvgo8gwqnterjCGWNQMD+NBEHrs0xgMl6xtAzAwvTDpmcA/7D3K+r0d1PkYykeOJZJRXmPj5x
 34T1SqBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508070069

On 8/7/2025 12:43 AM, Mukesh Ojha wrote:
> fw_name in qcom_mdt_bins_are_split() seems unused now, it may have
> used in the past for logging it but due to code refactor this parameter
> is unused now.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

