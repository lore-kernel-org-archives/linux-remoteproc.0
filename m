Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63293BA220
	for <linux-remoteproc@vger.kernel.org>; Wed,  1 Apr 2026 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032591; cv=none; b=FfvSUaU6Vr6AP1aYenvdrWiphGXYou+87PDx9uTXijPd/X4/yKAagOXP3sONFe/fPeB/j5TV3KgxeH7cHFj+b5idB+/GU9qdxB0qC9sr+Oh4mBc3yuxt0+AzkkHSo4xqcGqQI0o4YJEs2y28/roLhS/RBHPCteAEjqIdGPQLS3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032591; c=relaxed/simple;
	bh=sb4RURzUAdCqXijAvVp/9BuaYDqBVppZ2cO+8U1LByU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R66nhHG0UTmZHChtWLIKGzKS11hcYBF/Af3xl3DW/1hUMRDnkziM9GOIQ274igrv3WUQUjUawc77mtZigYjz/CtqPPJ1HnfrIr/vQ0VdW8OIC3Fr3tz1BW6I3CpjONTxnsA/m3uCyzbhDWxWBJSejk/Cc4/iBLXdHz9WKybcgcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msl5D8/d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GWM4Wr4E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msl5D8/d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GWM4Wr4E"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317VD8Z1004315
	for <linux-remoteproc@vger.kernel.org>; Wed, 1 Apr 2026 08:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pleoO2+ScDGyxUSTdQVNShDUCf231JLgHqq1UPZRoS8=; b=msl5D8/dfnYthOpJ
	dbVvsd8FVXvemaeD6nIKQDvACvivDXAz362MYozJUPQMe9BAn7yRkrBI7F37KVA3
	d9iSRVWmadkT/Dg3Gp5bTeJegxwjXkQdgmZNfGiRaOitfvIdOUww5ckJjJrb4L2+
	OljxON1d4RrIS72MTRhY/IJbeJlOWimbaETPmwmWNNUj1RKUp/Be8gfFZ0E/31J5
	G4Mr9MSkIQxbqol+o502En5G5y+cqkB0xzez4YKrsEqHBVWgkHvbLfR5OTTcUs+E
	XcP7LN2zvkcF9waMtDoAQSOcpQwcj6T0lEBJziwgO+tVLS9D5Byfvt/Puy8m4uUu
	8F4rRQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjhbqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 01 Apr 2026 08:36:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4bd8e77dso14205401cf.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Apr 2026 01:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775032588; x=1775637388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pleoO2+ScDGyxUSTdQVNShDUCf231JLgHqq1UPZRoS8=;
        b=GWM4Wr4Ek/HtKL2B10YxGrbZt86FHBabc1o3TpLDbc4Ba8Df7U5eoBZJBtSumQ/Pjh
         2sGb7u0PZBLNxQp5zO4dfSpiAFLyFjB8XlKPm0TnJbUZCxyUvxtNd1bmnHGwfYVq0sUV
         xxBFVhex+y1CNpOCVoZVsJ/sd6rLov6BHFHQqhyEOz5ZEhudF56FwDoEiVcUoe7ay/X2
         zuptd3T+A2keZOHc/mJP45ObhrTCiFtQ9MNSGno+iC6yIQZxQfxYBNqShDjmOBTzqUxC
         yHrUmJSBlVfEeZiU7h2Lzx8d0cNMS9l0zMs9sdS1RPWOwYAuW6V7b39JRQpKTpShYwsb
         M1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775032588; x=1775637388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pleoO2+ScDGyxUSTdQVNShDUCf231JLgHqq1UPZRoS8=;
        b=VY1vwW0bfifwezSXoxEpgfZPssmKtHeJBdwoPQQYOqohh1lSMUTbtSjH6Ma9r9VIN2
         MJZCOqYquqFODRCL13ZhPDCGb5SK4NjPV/twX370oyNQrCXaei+3Qejb/WFinJQw4wUu
         A6vQ8FFy0Yo768/O5Ebd70c1ihICEabyHkpJlJjCWtRMWoJEoeNaBabo7XOug1RY4xcv
         iuDYGhpdkAlCKxdbnebuPx79aLtAYB21aeJoFzrWn/JExCpp3LOI5l97aX4ry9DOkz9X
         ixrx2LPAOSU06Vgmf45Cd6b61gpm6nSpzkQcgr7IxlHZGppQy/NP1+Rds1vczWMOKZ65
         RV3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuUxa1U7lohW+6utHJJgAPMRS6v5Rln9e88lyzLWiefkSt5nWFxmma1cxs9NOJXnyeWtEeSqjchwp+Ww2sTg9K@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9kC7HCb4jVQ9tTEbe5ZMvNB6daI5UBU4SjQ59e1Q+w8a3Qlg5
	yNp7H4ByJMZEu6KwZZwX9iizyZo4larCKsV4FmAgQsZKtX+MdmbdtvEflxXIu2bpVa5zDp3KLkC
	z8ZKL/gayDKLyKlgMmb9TRPkD4jTCqsbEMK9wmp3e3PGLhEu7I4+NQ07/aHt9drrHdnsSsOuy
X-Gm-Gg: ATEYQzz9EMHzHucR6bAzwGqnZbY4/ae+RfM1CU1iyYMY1aEPvtAkIKHTgPRCx60VUqB
	rCWhb1SkmMIDGCFwOV3ujxLzigO173tSDg8nWC6SdWAQp6SCy7J7JgObg2O8oA4/AahSdUqBQD7
	tRflQ4pjAT+v+1NJVO86jErUwzsvwm9UtfbI3Y8qaEOcFZaMhENBc/35/IRLEq/T1d3ip5Jf5dK
	FCArD8CqG+q/ykAqRUoT7MqRT50YVkBaGexRtyURs6jISvC+R+i8OAZQUGpeRBebMucyBR64OVi
	+L7T3v3gt0J1jKzrCxTwK0+wG3zqSgV/qSZKT+xrKFqc9kzlRfuLzs9G2UHGivWSxwVm+txbUNM
	dTeZ3gS9Izwr/9GfclDT9bZ23q4Sk2LD2qwOwqpC2n44VcjgZyv37l7VAYm0Xu/Luw8wg7+sOkp
	pAKg0=
X-Received: by 2002:a05:622a:1985:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50d3ba26cbdmr26700931cf.0.1775032588005;
        Wed, 01 Apr 2026 01:36:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1985:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50d3ba26cbdmr26700761cf.0.1775032587543;
        Wed, 01 Apr 2026 01:36:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b76078bc0sm4300932a12.23.2026.04.01.01.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:36:26 -0700 (PDT)
Message-ID: <967f491e-5776-467f-83e3-fbe4ca10e550@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 10:36:23 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: qcom: Fix minidump out-of-bounds access on
 subsystems array
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260331171243.1962067-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331171243.1962067-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hu8I-VcekM54v8otrmaa2J6xu2-X7-iG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA3NiBTYWx0ZWRfX9+4+/bQ9CS7D
 I4hBMRR2IxMbu4Y5W2VMXens3OOPIg8jjf8uSo60IzJ6Qx7Z4ahTCopjCvquRYeiysYNVLLeI6F
 GIgsWUXdk02+9/XPbP2s+i9DAU6l+d4qIksYBG93+Mrd+2P2TRQHmw4UJFgQQnMoiP5xSV1J3xv
 ym/co0OyGL6ha97iKUcF8jFKlzzj6p/yydb07B8T8uEcPOqXlLB8DeLZ1MVRTGPygSzn39uFLe8
 EgYQJz5+c8itdNvVF/O57/HdXwld7ANBEM7s4E6UF/gf+2d25LJRGy+0o1o5Dxz5RxFfvBAg9pX
 LmcM76wqK1z6rubzhEu5hBTYkwNJ4wUVCaZZe+wIxXNuqI9WyIjWRa3QofEFMIZ4CqVW70Ec+pM
 /ITtxRNpGc+vGCu3RLmF9u/0FfOXLt6JWu5ss5CdJ5fW17kCGd92s0UR659cgyYVCtW1AUCL0v9
 nS3BHuwo1+wMpoaF1QA==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69ccd90d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dHygj6CYKjtJtfZXbZ4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: hu8I-VcekM54v8otrmaa2J6xu2-X7-iG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010076

On 3/31/26 7:12 PM, Mukesh Ojha wrote:
> MAX_NUM_OF_SS was hardcoded to 10 in the minidump_global_toc struct,
> which is a direct overlay on an SMEM item allocated by the firmware.
> Newer Qualcomm SoC firmware allocates space for more subsystems, while
> older firmware only allocates space for 10. Bumping the constant would
> cause Linux to read/write beyond the SMEM item boundary on older
> platforms.
> 
> Fix this by converting subsystems[] to a flexible array member and
> deriving the actual number of subsystems at runtime from the size
> returned by qcom_smem_get(). Add a bounds check on minidump_id against
> the derived count before indexing into the array.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
