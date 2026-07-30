Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49057443E4A
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 16:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429268; cv=none; b=FNLd0SfLsGLo+BCUnnFIQ7IDIFIUPPEg/vVrK8faydMkBZovLXv3XPViJed9/NYNzfGaj9sSOv+ghE8kLPQmPabuPeWhMlvvFAle3l0S/PJ6Omr+ngJuJEaS3tMTOGbeU5IZ2eEIvqcHji93IdFQnbUR+rdYW2L8mp+pNZ8cG3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429268; c=relaxed/simple;
	bh=gXRfC2VjDT+XZheOHTbKbVXeBbM9bMyYA1/mdxx+YNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tuOpikl39Rn5qdeaJ/Rg9/dSATxb1P4V58c0ayMiO2ECq9lvfNApLGwMyo0icqujc5qUvqzeEwDRbJsSj+yRpMVelSKFl+cVoRobq/ez5Nl/d8/t1f0xCaxc/mSbK3j6sCzP8df6gAe9ivne4PRc+O7bAmfAKZ1eLVa9rldd8LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OPWTosx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hoXwg1RF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OPWTosx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoXwg1RF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGXXkk1571735
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 16:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XnjmdFxiHJbplHqHTRM7ARcmcbr5wAPPkXRM+q1ZZUI=; b=OPWTosx7xtooPdQV
	yHjJ9jqz2rPsoV/aQcdBbj2WYdVyYFc3+pR9Nj95skiup16r1SX477S/gIEdiIQy
	2OZEZ4XGs2PThTrpQbjBzqNmXguKyQeXssRrTg51tZX3w2mgPXK32H7Q8vSxU6Ok
	ifoB596Q+i+aNlqiXKsQsDi8o3DC//Vc2KJkYYa8Dod+TQo7jJ9yhBveMG7RG/Dx
	N+oJEj9oVl5z/Oj59WwKiHGgT2V2orrdjlxLrb6lnnfZRm5zgEVQFdJndVAgofKv
	aKW9LxFMjuoBN0DMBkUc08CI1upgaOBUUR/9PQ8EsLq3kb21g65hRauxd6QRRu89
	mOhP7g==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr891grpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 16:34:26 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6688d64bf2fso3358820d50.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 09:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785429265; x=1786034065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XnjmdFxiHJbplHqHTRM7ARcmcbr5wAPPkXRM+q1ZZUI=;
        b=hoXwg1RFG0f6ihOF8Nm6IKR5MVmyknRS1dlLi9BlqQxjoFyfA6MeoR2rtZxh+BC8wW
         r05xB+6lMcUgmdcZ5TjiIwqULlTgBlNfV7Td8AlSolFAatGxnLqTj3YyHsIxE89GVkrR
         aNiCRX7Op4qhr/UcCHrM1cJyqK4A6icFLOB+e2Icld99++Yxg+dGLPJBaVhMEBJ96QIQ
         d/Bkj8WSRj0dDaYX2uCAF9pFusvLKMbwi+u9/SniqC4AGpgJigbhEtoQJmmr5XIgNUNF
         h40DGkO1BWh//27k6pucvDZiVaPTU+NlUSpX2fyjFxvQOMzmJ2LE+R0MeSAwWxzuaWtH
         /HqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429265; x=1786034065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XnjmdFxiHJbplHqHTRM7ARcmcbr5wAPPkXRM+q1ZZUI=;
        b=Ra89jYss3Yw6SOfm0IvBU0YRDO5kPXqZBva6B1cIK3KhJtBBOTqAgYfqstaC2DVkuK
         e/TOUCMrzIZO/g9Ru1P2mVrlB1WvSvEYWO/ttP9rijmIlaF75F1MsW3WuXMedHxht1wr
         M9e5YqnGCj0fKrR0wa2NB0ZukNdEwcHi5o7kWvBZnLiQ5FfcZryJpvxWwW+9Ej60Cw74
         rKTTKfjkn3ng/LJ2VYbBFlulnCjO8TKhPyRnYse+Fg0rD1n5MMyys+RTXXwwMiw9OP3r
         57qySS5sHBO6g8ai6sP3XTmDGrhN3suKktsCD7lV8ob/JFbMBMi4YMXky3abDb62ko+Y
         Avew==
X-Forwarded-Encrypted: i=1; AHgh+RoFGn8Kw9xq4fPxNtogYVZ8Chgkwznb91hGZsmsqF0td4cmVdDnTfuOeuYG/p9dONX1Q0fjhkzbynxMnyr9wV0c@vger.kernel.org
X-Gm-Message-State: AOJu0YxCw5LgZkZekl/Z6qhmHFpFjPXZULXbG597w84hfe5YBd8efyw6
	R/S/fvzRGB7fkdUeRDe7w/Pn8AAyueaVohqKGCZ/arDl9OYdriUtbexLMs5iHFHuBgK2zFZgAnl
	r0aJlqUREhbKOLFINghPmSCqYXFuurAclf+AV0JsqNsWSkyB8nstetPZnQEAubItp9iwT3MuN
X-Gm-Gg: AR+sD13LoLrcg3qX/k4tJY+02RfKx06hWK9EZR0NAc+RHNWWKSvLy+HuF3Sh8yhqhU9
	i3j3s5vZJoHz4gKKJ6kqMQtvIzpGTlpDuHROPtH6IWAQbTP3PpZqHvSnjkF5SMqBrZexGRrrnKa
	0Fbry/x4qbGhuSFZ93wGltLBFNPdLUwjN39DX5H/TW3AbN9ykxgU43VluFxBwOuckwB8mVIXtv9
	Mr1h7/E43Nw0RjjQecRfhQLiWD/68YV0kLrDAhlhRpNYvdtKiiW2wBi/ambbPPwFvYN6NRudUee
	BXQanUnPvRwT9SeKjXlDWClU6E19dj3+RlV+JL1l1wkAjedMSqsaWfAECOwXzU4ia0p2AgBK0nG
	UEMJ+kkSOS2aPOvhXjCrgzRYd8y5hKcciI4z8VqHSSKs+s0aHqcWsz8iqwIUuj58xiA==
X-Received: by 2002:a05:690e:d4b:b0:668:8986:83a4 with SMTP id 956f58d0204a3-6692f83a99bmr1913816d50.98.1785429265547;
        Thu, 30 Jul 2026 09:34:25 -0700 (PDT)
X-Received: by 2002:a05:690e:d4b:b0:668:8986:83a4 with SMTP id 956f58d0204a3-6692f83a99bmr1913793d50.98.1785429265109;
        Thu, 30 Jul 2026 09:34:25 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:2206:62e9:bbc4:c360? ([2a01:cde0:108:24ed:2206:62e9:bbc4:c360])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c9315ddsm1608848d50.16.2026.07.30.09.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:34:24 -0700 (PDT)
Message-ID: <9d14fbef-43db-4463-b7d7-e5daee1368e6@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:34:19 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-5-973cd3a226af@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-5-973cd3a226af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNCBTYWx0ZWRfX91QvUUf7CAwk
 2k/NhhiX8Z1SqM/WoRbKhU2h9aD2Gcs6t01vlbJIJCEedqaXLYM547J0aA405SvRWXpVGfzOyte
 cSA/f0XUiCxbYevxEqW688MW4byNXZhenpGmIDLvJ9QkNSVFm4JdMsqGNNXtJP4p2vbP6a8kGh+
 TUr1G0LqhoO/U8iEZH/fLAZG7kDW5+ZemlxfRj0fqAyB1GP7ZIa8DuLvnxV3X2xuJjridjeiZ0V
 k7EbKSn8+8QFnN/VSta/xaN5VTshxeGLuEjWAAJJN501wIw4zQq8TuxEs8dUuT3itNgNzJ/Azcd
 86u0mcUE4T/nelVewqR4LmcqHPDRDu9VLe7FDFj5Jsm6avfua2dX2pQ2celXLDwGg6DUB3cN1he
 r8bHIT0ruXQ1XhmKr9xp5/QwLMENryEbwGrd5+lWZhZIzatjutvq2IhRhhEcAkMzhDltQJV/HuT
 gHXlBIgcQFMgra8wkyg==
X-Proofpoint-ORIG-GUID: f4slhIl5EKcl0xJgulCtCSAMkgoYiH4s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNCBTYWx0ZWRfX3G6SWOyg3ugB
 UI0ApOQldUdcH53v1NXHmDfN+nPdECxwYo0hxf/97sTPleKsyUhPPkTYw5g9sSjfETm1kYwKcbx
 +HfkqKQhoCd3t1vExNgA4QCwmwk+eTU=
X-Authority-Analysis: v=2.4 cv=PdzPQChd c=1 sm=1 tr=0 ts=6a6b7d12 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=oKFihCAVH3oSEhwhxOsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-GUID: f4slhIl5EKcl0xJgulCtCSAMkgoYiH4s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300124

On 7/27/26 16:22, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
> when it reaches high temperatures in kodiak.
> 
> Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
> for modem when it reaches to 95°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Since the remoteproc_mpss node doesn't exist on non modem boards, the
> cooling-maps that reference it cause DT compilation errors. To fix that
> remove inherited mdmss cooling-map nodes.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
