Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5066339478F
	for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2026 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778579049; cv=none; b=pSggRKyyq9ODeqqvNqV+buoxpTceY80gXRrfTCByZtT2FY/qSoD1uXbJ4reDq5JGVtt4A4edETEaX2O/nJR+qzUbcdnFJUm2aW6u4JU5N01qX5a66oYssQZyvMyk5iAPkckbL5YLps2H3RH9d3J6fZnmeJoDZpfvHf0pfRGdcKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778579049; c=relaxed/simple;
	bh=Qr1nf5Xha3Mh/hw1Q30JIFQr2Qbe+dT6JAAhBNMo3/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TfcjwZFEI1lm7uhvFOg+3XkYwcIiEAfqrF7Fzfbbz1rhZpw878lQNOXsKkdpCab+x1xu3bqCClszL8dh1jbHZzbJO3O5izEV9/osFgoh2AsxhOmpuzO2ghiyCxNBQOPXmcEwKyENZXjDfPD7pDQAKesQmaMlWCvX4fJ5zeobRYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ayc425Mm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXsP0jip; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ayc425Mm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXsP0jip"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5CSYW2186404
	for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2026 09:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	saDcBQsNLMQDm7B4hXI2WXJZiE6XgkpDoSOdYXaio4Y=; b=ayc425MmSsO2M5zf
	+hW2qL4eexmByKjHvnguCHZObeQwnGo5bGqw+Cd8Tv4plmMOsMM7HHMqEQqfcLRk
	D4nAK0E9ZQyvUt+qAqdYCoE/besCoQxxOLrIvQCIm+iMTavZLNuB9DFjlk5NUc5V
	gJDnRE7M4S1Mbk2bto5ntWE0Ru5vZae+MxB/dbb+wVeed1rwmnQWJloZrJRTaPOS
	RNMH+Ba4s2bQZMuYZbWVTdaBYhCO+iGyIYWYODUekbfYPyi20bzGc+nqqVzu7CQG
	7wCelJNzEp+T48MR0vPiTkKsdSnhbEnl1lXAjw5EciOOubLBO+S5X0POLWIpUFwv
	UZjL3w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0tfm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2026 09:44:07 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f8a5c02b4so464462e0c.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2026 02:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778579046; x=1779183846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=saDcBQsNLMQDm7B4hXI2WXJZiE6XgkpDoSOdYXaio4Y=;
        b=TXsP0jipAyhU9qPUmLsTcmKdqNEvyGfPGCq8FCWbnub7OcqMGJPg0JOOGNr5SxP6dm
         Bd+BmewOiyxOtayWpBJMAeUkww4GHbS8vacb0IHzg5tmI64EA71FaTaqsK+xs6B9hV2h
         vMDKw8Jtvvm9XxspLWtx7sNK0/dsP73MHQy8K/mmF2aRAGToC7nHWy5WFUqyZQ+xm2/C
         TEMKKKF7UwekRLBzxea0s4QXodhtuDbBnLsCVqKFmY5LhWRVy/2l+XcT6olXVKon38mc
         rbttc2znwcB6gPCvlcsd71KDcr6nw9JGWSDzTNRezszubHmduOHr9UT8Y5Y0C5vK+Bu3
         mESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778579046; x=1779183846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saDcBQsNLMQDm7B4hXI2WXJZiE6XgkpDoSOdYXaio4Y=;
        b=FtYXA3WtIdFtlyH7dLe9EaFVBAZel675W1V1MqHZpk0vmwLAz6n1rGFh39ka328DmA
         nR/6JDe059kCy7g4yKoFHsPEwZ3hxrOjjJI0XyQ6ag6xXslXAmGMIS3ZHYQGff62KrIU
         Qf4NyZrHA/c9WXNU5f4uLrFI84bbqwVHjm12/qN/d5dItEgDIHMYj9p0WL0OGIJpZner
         5SFiixVTDHXiFxVKN/+eRZrBMdNuzna0oflnSVLsNJLB9NrZW0f8GmiIVH54wd7F1+tJ
         Fn9uqJXhocULr6NwKU4SKNawNgJ5YFOmrPVVZqhs2ObUj1L07y8XjLE64t6KslqyxAQV
         6OBA==
X-Forwarded-Encrypted: i=1; AFNElJ8iFh2/VU33oQwGK2t2zQOkmlJWYpAYrxmaj73AE2OphRMrZ3knDLUbj/cppJInEZobRF9IXS7TeQq1+P7wpWXk@vger.kernel.org
X-Gm-Message-State: AOJu0YxPEIzJmIEt+2IrLP/dDy4CccH+rAICrqc6LGg2uTnOdZQ8bAQy
	IvbacRxGr/3sEkThdtjLzpxwgXrfvM7ch7GxS2PiYdxYQcFHtJAZaTEpc30nFnrl/xovtX6FicT
	/iNbOMYfGUEbD5j2lLTpS0AN66q9fA38dJ1UcZrK0oFyYkPs/fvIELMGfvxg90CGsUeFMu4NA
X-Gm-Gg: Acq92OE9+P9Vsv8dw/VQDOZBsJ91X7P5pylBqzp7C8Y4tnk0LxOReGV5DIp1WbKYQEv
	VJW/WfwmiXv6/QZmBI/teBTN62A5Eqv3DLGkNUlKOT9uIOMRX/gKuH/4nHcrJEEIZTwf3WNY9qs
	QMDv4ZTou7gcURHFe43T/qz/x2hJc1y4WUg1J09Dj2seXpeQl0GHF0Lk88F4QoqCRE8F9g+X53H
	jb6jZ+nyEagdYj1w2e6eaQ0RApT0aYnqLstRgm7YI84vMG3UdRGM5oggqSb2KHiH6Jmr+iMyqbE
	bWaLIz4xr9R7xzre7zehmq/EZ97qgEs3rj2gaFniaAi5FOa4KnSRwDUYX+7bta3cihw0F5ABJKS
	qrjByNQ3DZyVHby7lK7WtnETGTQ3MaGQ8COT3XZ8QpT5aq+gGPuAmda5OdsX3vP3nyPJK7xcAZl
	VtLXQ=
X-Received: by 2002:a05:6123:420f:20b0:575:1954:439d with SMTP id 71dfb90a1353d-5755b44d400mr4487371e0c.3.1778579046534;
        Tue, 12 May 2026 02:44:06 -0700 (PDT)
X-Received: by 2002:a05:6123:420f:20b0:575:1954:439d with SMTP id 71dfb90a1353d-5755b44d400mr4487364e0c.3.1778579046119;
        Tue, 12 May 2026 02:44:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcc1ba096cfsm512321566b.34.2026.05.12.02.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 02:44:05 -0700 (PDT)
Message-ID: <1b39329a-a900-42e0-a7f8-68b7467f8361@oss.qualcomm.com>
Date: Tue, 12 May 2026 11:44:03 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2] hwspinlock: qcom: avoid uninitialized struct
 members
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Andy Gross <agross@codeaurora.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org
References: <20260512091339.31085-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512091339.31085-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA5NyBTYWx0ZWRfXxTDaA9uqXUTE
 s1QEz5A23qIrWLk35i+PORwXK0L1PEmAdb8wwaQnv5AHVpL0JkoJIiDU/y2z1n7seiiJ1G980am
 Ne21p9l039XofH6S3q/w1cEzlWYiIgY+0m5bL1rog527duiKjPluQvoxFlzB0Kkq6BtEn3Cezxa
 CBHSM3eMVMu7U5Y8pBpnh7vzg3y3D1b0cVHpYt5faM/VxNEfefnjZWNSh+10R5kRCrqyrDFAejx
 b+atMLBqEQGYISPyg7disMHa5kpiXClCfTSIj3peiTWKqOXT2Yg+w3+FW01LVl5JPglJOm1x/uY
 E86zgLMwG/DaK7G3Tt8HfOApUzu+eWnJIu7DYOH4cWYsGZyTEIYZ7MynNvj6eX7flTfUxYIzRNU
 YOD7QYy7JPxtgBTL6bYo7qQUsTXG0vUm/kOH9/G7oldl33KZBfB8X4+u6gDsVSiIvOJuIWITbJq
 sKLuY0Fs2Ff14GAkeQw==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a02f667 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=LDBv8-xUAAAA:8 a=EUspDBNiAAAA:8 a=vOGn5UrjK5pWd9rhyCsA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-GUID: Q8uZ2p6jDfZFnoaoa8RUkCUc1OiCyo0_
X-Proofpoint-ORIG-GUID: Q8uZ2p6jDfZFnoaoa8RUkCUc1OiCyo0_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120097

On 5/12/26 11:13 AM, Wolfram Sang wrote:
> The reg_field is allocated on stack, so using the REG_FIELD macro will
> ensure that unused members do not have uninitialized values.
> 
> Fixes: 19a0f61224d2 ("hwspinlock: qcom: Add support for Qualcomm HW Mutex block")
> Link: https://sashiko.dev/#/patchset/20260319105947.6237-1-wsa%2Brenesas%40sang-engineering.com
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
