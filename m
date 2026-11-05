Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894177;
	b=zt03ddphAyrP/cVXWDi/UGskf9HnGmHTvTRQeb3XZAtJvpgbZhHPkTtHYr4jhkJzq2tM
	 q9rvdZEexD+9OmR30Xu0h7VArjTrypEuWKCGlNb+S7/JDTOiVfxtST4FceJpEudS1TyZD
	 2vp3EVDYz6OITrjwwW7J1HzVufrmrij21n0wjtynJ/3L2FqaLR5NNl3PQYUiO25ghIukg
	 O/sosXhvH5bWIhYJlkDooSLOmAv11U52+wTsDAvaAhZgX5QR8s6D7vsi0YUBpYR2TjtbZ
	 fjAxNQHrwnkA0peZBCDXnS4SSW1JVnb9Ndrb6GfufK5ru5U7mcJdMqRIHb+oc1Eie+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ki7aOO6TrYV5ON9Wr6DiwhdoVkN/dGBtKK68o1BM+SI=;
	b=HONtKh7nVT0Rru3j61pVqqQ7HJBISIW1y0746wl39LqrwcI4P9h5mBEQ/JRAZnTw8Bur
	 692F6P8n77zr7zkMlQVyxM8sD+aSy5GUWqhVf96oIeL0FlTqujLoVNVi80Pdqu6oEe6D6
	 f//rpZYhQznSFkbQwVNsIzWqUyuCXAQlzcTRHISvOM4Ozu9tpAHVMJLzYA+uwH933mddY
	 GIsKbvtCyxzWgOKvp0GTREY2rej0uiJR8l+Yw4aZS8QCbSNp1ArSdAtUXk/CkZydsvBYK
	 cY+jxDpgLKIJDqFR5Svo1KUJYWvWuH/HioEJsRy95X52Ss0Q3otq7kcq/NVCVbsA6kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VGBnFV2r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kj1QSodU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8436606E57B
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Nov 2026 15:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8436606E57B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VGBnFV2r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kj1QSodU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ8R2094492
	for <linux-remoteproc@vger.kernel.org>; Thu, 5 Nov 2026 15:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ki7aOO6TrYV5ON9Wr6DiwhdoVkN/dGBtKK68o1BM+SI=; b=VGBnFV2rEK4ucWip
	EowChD/fmUTCxMEcHGvovQsTFk/mw6GNfzfQyRCq3ob0jai2N79faah9M3C5FvNu
	AuT3kNRGuRprGpL/VWoPaeW4WruB02+oul12V1KxW3ZpAlSGw3qGA0cfOApRb4eK
	7XtD2EJYplGqjKpQWhG7Uab5DaXq6wGZA4XPaTa6i5D85uXZZTden856MxEJH1c/
	uNzRD6nZam5vz7rrEvkbjEiaHSDSQdnV+43cahZkERYBdSfQIMeKGqwMnn3delAm
	aL2EKUsPvxmwvPizsvDTj0dSsoKF0qvBAK2a6gsMCKOo2goLbAWQE16hSxJTZ+sA
	9CZAIQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43jx9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2026 15:56:15 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eab0ea26afso96942e0c.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2026 07:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793894175; x=1794498975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ki7aOO6TrYV5ON9Wr6DiwhdoVkN/dGBtKK68o1BM+SI=;
        b=Kj1QSodUVuTeyhUZgfsuUeWfint1bplIhadjKIpAlGtCE2AQcM4jpmV0PWh01tQJJI
         DxxhuQLPdbXAXyc4Y873hqE+1uudhOPuoSa+Xd9+nOg63LvlsYUW+3w9MeQ3J35lY5PB
         lyVYr4iH5YEx/kmy4Za912OP8Gr6D9Ms2RmVTFTZ+tshLaE9jZuj9N/e7jJ9WT5WtW6c
         1+mHSv7sbRievhtVpHfn0Mkpfc7zqIc+TGeOOOqdMXNhPC0okJvtBranXgT6xY1Akl8q
         lTNCfDpzGu5JZnBflddrHhM0dSHkphNgRjB2PFjFC0ZehfmiZe5AkdJHqfsN1lXRgai3
         Etng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894175; x=1794498975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ki7aOO6TrYV5ON9Wr6DiwhdoVkN/dGBtKK68o1BM+SI=;
        b=mu2KTvdm1RokfAqhAhiz7f7Q6uUyijp7rgSFeWJtKJbH14emRnDemLuusjg6mxw/xB
         6icPqHsQ3pj4w90S5BY5PjtpKKhDz2K1uGD2dAnDTaiMpayaJRnbojiayIfsRC8gwzS5
         Zxz/U2ME4OZNZea9VLejubitdjwYF6ADvNYeepg1rT0YGAX74JorqavSn1Eez9cj/Rsy
         oHnisFwrRlTX89GkvUm7eXL0Yd+gqTFLfE0mQ2l4s6mWieVhgrwNyF3dSfRkHK6ZCXzF
         HJ/Lps5T/VyVxkqkieQxV5ppBsK8SS0GEBWM9lZ2YxAglOTH7xb9y9BpyAhzD8m9cv6X
         sczQ==
X-Forwarded-Encrypted: i=1; AKwUvByXwAUUI4Bccw2epXFwa3l9StkmH9aSCjz/PStLrtWHmijzWfTPBC3MaiYsDWnP7uLPMeiGtj1k6CsdAvengSjP@vger.kernel.org
X-Gm-Message-State: APuU4Z8RmtWMI0Y82rXWQ943p11homkeAHxUIxRA0IuAXHTJRgRZG3G3
	G/d4KjTAJ82EGl6L6Fikhr8nEUeY9vih2B8WdELyQwRiyW+EICZCuY0oNNa3E4YSeEP+3q8VAdp
	ZHa1q2DA2m6F/VhJ4GaVD3WiY/KR6n2NjT8p4/u4HomaCXDUWdmVLZf8oetSoS73E6huIFkyOzi
	tsHEQt
X-Gm-Gg: AYBFou2HNn37dFViCpTC6BcO+oSlglYYU3zenMDaDdx4H3X9mCWzpW0DYHtlHbiOmI3
	cJd+/TZdr5SO/Akj85KoQ+CYbyD+MaCAmjTDx2ftG2/+0I9KV+AETM5zrO9rYrVrXH1dBJpSG7I
	mMRJEOZjA4D41cWs60n200WoB0L1vCubP90CI66mPS3OORw5leVUL/50jPQYahY4uugORS2VN5o
	kmeBhDphFeje50xAzVRR0jaegkOkERCOFenwcSAOY8Z8ygOiiyI+rYhwjByxfNvn5hgqV6LTc1F
	k8Ve6I1xBteXg5piVNOoK4VrY3Aswr/AX6+QPs99b+9D2NNRFDlnInUzbArrTQAozl8WKPpyiuJ
	PcnYi27WEw3o9DffERRPuVW8XbaZv7wFL2gBq8KBKmtI5C4pQ82lKFrORqlHEDIKnvk7+
X-Received: by 2002:ac5:cdb8:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ec7562c7c4mr8492613e0c.0.1793894174927;
        Thu, 05 Nov 2026 07:56:14 -0800 (PST)
X-Received: by 2002:ac5:cdb8:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ec7562c7c4mr8492581e0c.0.1793894174381;
        Thu, 05 Nov 2026 07:56:14 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4422d1sm186151966b.39.2026.11.05.07.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:56:13 -0800 (PST)
Message-ID: <076f0e7b-8fe6-4e9e-a0bc-a80ee83f879d@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:56:11 +0100
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
Subject: Re: [PATCH] remoteproc: qcom_wcnss: Clean up subdevices on probe
 failure
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261105-b4-wcnss_unwind_send-v1-1-ad94209143da@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-b4-wcnss_unwind_send-v1-1-ad94209143da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GP73v26yE7FSFBKQCuZ9PI71MuCC2WRf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX/f/FqR6IZcOW
 9l0Ar1AZPXJNYusCE4x9RMe9gZoNqlPE9OJpaMJ94bdp6VyMYxtoLz597h7d7b20W58we5pb17C
 mkt2XFQ2OdfEtdOxdPWZ0w19q3I6R6tMIfH6rPNQBa4IrO/o1GOcQ5P9OJedTEF2ZxUQFBY8ont
 RkKCeRk7vbZGABT4/zsBNG8HIAm4dMHJ38NMahrAq8TLCXBqJseVdbKh9/GLuFBC/Tda9tTo6h1
 b+efXg3ao6+GXzBuEIor7XuHFRULvy3xuUcM2reaBTeP2UuOUXXIKwpcgG7x7mEXW2nqdjICCzY
 EADrPRX08JIWDl0GjBWi1w/ygNeRYGWKxj4W4rN8tmd+2WdQaTD8ghW2WzLlVvA2eetuJ8A4JcK
 uaeT5oCgHwYtGtni8L+zkokNQQF2R7vfnCxdn2KaySzWSSFwpbEnFgtsgH8yh/bv+c0HQ3Junhz
 buozWOYrJF4VOWP8EUg==
X-Proofpoint-GUID: GP73v26yE7FSFBKQCuZ9PI71MuCC2WRf
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aeca71f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xmF1v6_2wodPUg2ca20A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX1z9OQHYrNuuE
 C+5hHLpzeGVo1BqSAEhdqMu3Zzlq09pllq8sQBxRVoNKq4YhEaH+VdRkQmoxhjdEM6PB0ZlHWvc
 Jkz4KLgBzQAYJwn/bRdkm1JxNC+Elm0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050063

On 11/5/26 1:31 PM, Anup Vishwakarma wrote:
> wcnss_probe() registers the SMD and sysmon subdevices before the iris
> probe and rproc_add(), but the error paths after them only release the
> power domains. A failure there, such as a deferred probe of the iris
> clock or regulators, leaves the SMD subdevice registered with its
> smd-edge node reference held, and leaves the sysmon instance on the
> global sysmon list.
> 
> Unwind in reverse order of registration. The sysmon failure path skips
> qcom_remove_sysmon_subdev(), as wcnss->sysmon is an error pointer there.
> 
> Fixes: 5a856bc63ce9 ("remoteproc: wcnss: Bond SMD edge to remoteproc")
> Fixes: 1fb82ee806d1 ("remoteproc: qcom: Introduce sysmon")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
