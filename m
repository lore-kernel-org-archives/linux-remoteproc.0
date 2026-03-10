Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4426638D688
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 12:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145553; cv=none; b=kHl9crCFd+5bPbHoRADJyS+KTTGIJJQ5SEhK7BHEmqu/bRoXJV3RS80qwMBCqDkuhqYUOxvALjmpA/gvr92iC0X6No1MeOpWFeWxHaue77fXeuUICNC1EdsRnApMHqq0ra/8EKnbvWx7A3UfSLPC3jdnxIz2/X0WmYHqBWd+MOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145553; c=relaxed/simple;
	bh=uivgBP7K/awXFJGAmcE0/jOh3d0JyXcOb2NQTmTqwlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bw3x4pHFVwcX2OKOYD5bjPeGsN8hax9l4GG+BmCUFJlUVXXHaC78gLSGUj0GNCqua6FSc8GZqtP/wa6mjxVPCO9ryL/M0J0UG4SQtBzIUKpQ8+g21QcA1FyNPhJ2dvTgLiRskqJWEEBnBIK+c3qD+nIQfqI1yIGxLEUMbBXaiPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2E2/h1S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNH7ZAcI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2E2/h1S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNH7ZAcI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AB9pGE568670
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 12:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	liZ2cxYZp/6QE1t62IyXlp8Jg6pdGNzadfn83X3cLh8=; b=C2E2/h1S9IIaiEH+
	afjDal5/1jJXEex6fe77nvxycyOLnufZhgmzh6+OyjCXfH379LQTXZMBEI8kNSLI
	eP8kAGAFE4TnZlLgVoKX9BD4Yh8N8E7Rh9yxmMRRkFsoWYJoLqMJpQAiOpYDlXsR
	svYHQ5g9EU5N42NKUf1bZqn9KHI2i4vqdLrIEKlIGtuZZdzANPqUT/3Qa0M6SzBo
	441KsnGfXtQlP9U1CnDlaALMQUAf3lByqSZeX6oA8xBcjEUY8Udaxj81x3/spweZ
	Ntbz3kIv8cIVJdYJVPpcHmPC2ICxTG1YKndwfsbX2kzrPeyoCIeUFw2FdayD4/xK
	dAAVGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8hemx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 12:25:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7f6ac239so1597390985a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 05:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773145549; x=1773750349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=liZ2cxYZp/6QE1t62IyXlp8Jg6pdGNzadfn83X3cLh8=;
        b=KNH7ZAcIbat0hD/laaUYhzCwHmguYNh75Yr3JRI/8tz6VR7btNmuUGo0+efwpeXI6+
         +qgnUdyaQIl9YkWxdBJDY631oA7MWxb+u6E5gGxNbzThAYisMSoOHvB9cxy+xt8Kx+wi
         zLgGFLf3qEKimmu3SipSCoVqgZPacuWHCGyqDHaUa4Pmror3B5tQ2pLBaW+WKI17mOln
         SlWtGfIvvMr45muoc1N7u0SI0AZrh270Kdi6LDUR7tkFxmI24YRjZQSZZxlVmiRoMa5J
         ED+rda+Rplv9JrzbACoE225oG2xFY6B9OAmiEfdFHvW1AfbL4eYgOL/9c3J3qpJlmEl1
         s3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145549; x=1773750349;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liZ2cxYZp/6QE1t62IyXlp8Jg6pdGNzadfn83X3cLh8=;
        b=SYfSeWdHYwzco6Gjx+d4vOj/oepK7g5cURnpQqiWgywPf8qYSVA0eddsoea3rId4+n
         NMy31NM1ZI5p7x2tMVvnh1c+6CPdhKBylmoJMOUgSTOLb1C0qJUHnLnhxcNSMjpqEM7E
         wero5X694i1vpzDjcwYJqIi5U6yR2NCicsyUCvW3SyT3V5hJfKnuk0xdum7nEsEz3ABZ
         jvr2K2qM9CqEFADyL25RD1zIneNR7aAwEQns4oUtx6z/U6O7I7vlafZELpmJ+zDi9SWQ
         0PXO7KKs+rKK4p126K2PZ4uxE03l34b90+s8v2z9JkC1XbGon2toWKDO1c4GyTXXkKoc
         gCuQ==
X-Gm-Message-State: AOJu0Yy8brJ/MCA8iT2tkcsrvBB9VXqPVQ+i1Qklo+bkl4POaJvcRl3I
	QZa16R+7RPg0Zh0bmojhM7qRp14QlxLE1MjvmXIxyFPO3tw9Hae6wW9rONEX/CZQ/UWx7hMXZ8C
	rAgAHRgFTcmvdcc3D2NPASo4tVjO7I5teRHQH/o+M7GftvoKILqIFFNqAVf4juGy37YjpgzHl
X-Gm-Gg: ATEYQzyEzy21PiM1Co59synotQ5enlB9fJZ5CrQ/KZP9vMpQb4BglvmllVblU9+oisz
	8/VcoboS+t6tLDWOOsTG4SDvbH70zOB1clbkqlIV2nRJO9Pmq5hwBXfbFYkpdMMH5hwOdUL4xMk
	mbJCBV4wOywYgdsKLfu/glurqP2Bphx+k2X/ZXbe2NvEEzJjBIMH+GyyDfHAYYz7W716JuT9EJN
	5trMUozioqEGlBf0nzan4kdj2YCKbnrHR7nBWC8/sWXoGQ4gYmc1qMDjS+LI9gq8TFTw0y80yhx
	Xhc/moB/8NxRt+y1BBWQQRaGpTAd3Pc0Nhb7Y+cF+zlLJQbWcgWt7yLP4Lun9X3F+l+osnRjBKb
	wkitgMLAAsEZtTVE7VvuKlODl8Enc9GHb14n6ubcpo3kigFu0
X-Received: by 2002:a05:620a:29ca:b0:8cd:982d:4108 with SMTP id af79cd13be357-8cd982d4247mr136296385a.56.1773145549440;
        Tue, 10 Mar 2026 05:25:49 -0700 (PDT)
X-Received: by 2002:a05:620a:29ca:b0:8cd:982d:4108 with SMTP id af79cd13be357-8cd982d4247mr136292885a.56.1773145548994;
        Tue, 10 Mar 2026 05:25:48 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08d8a7sm2641960e87.92.2026.03.10.05.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:25:48 -0700 (PDT)
Message-ID: <b8d70886-3b39-4b1d-a91e-ade3a71a3fd5@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:25:45 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] remoteproc: mtp_scp_ipi: Constify buffer passed to
 scp_ipi_send()
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Mathieu Poirier <mathieuu.poirier@linaro.org>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
 <20260310-rpmsg-send-const-v2-1-0e94c5db9bf4@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260310-rpmsg-send-const-v2-1-0e94c5db9bf4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwOCBTYWx0ZWRfX2XrltRyGEmHC
 wbqpZH8lZhEaKUoXeQDmCSmyisbm+KgUYIrRqVSaqM+nPRGrBbWSj0mnlEmy2vFr5yQrsd6Up5s
 wD/l0QUfOYWO3Iwx10yNTORKFhYZDKbxyn5Z3N+mUp7iMCvlmzrQH6a3Jg4xXYQGrRMrl7Qsz7g
 SK9j6ymE+t+g28uI0LLtmBNjQ1dZfekr/0hjTk9pJPgAn8LKuW/Ib4E8rVFbfM6elxNHgBefRvF
 h5ZPb9fwSuDBV+dkZmiJxQfDp+1ICY+ZO7aTN2yYqm8H7sWsfMm6fDGnAW8lzCdEiXthYMltt0S
 BqA71rjhe2FzqI7nX3Vtzsop49M86XzRL3wM1aDPZvrRtcEKWJZxkyMWt7SHZWtekG/cnC2gfkD
 eQKRT28nCR1cXgEm4jJzUPf+Neuhr98nEtO/ZRGfdbt4LN+S50+kMdpeycNhluvUG0LyS3pFCWF
 dxWnQBUnw9VmTNEPsMA==
X-Proofpoint-ORIG-GUID: NaInQHJNKnxlDHhYm2ABUE_LmrZg_USh
X-Proofpoint-GUID: NaInQHJNKnxlDHhYm2ABUE_LmrZg_USh
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69b00dce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=F0yalOKIwk99E2MxTuAA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100108

On 10/03/2026 12:22, Krzysztof Kozlowski wrote:
> scp_ipi_send() should only send the passed buffer, without modifying its
> contents, so mark pointer 'buf' as pointer to const.
> 
> Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>

This email bounces:

"Your message wasn't delivered to mathieuu.poirier@linaro.org because
the address couldn't be found, or is unable to receive mail."

I got it from ack here:
https://lore.kernel.org/all/aS3AU0gEEOvWs4Uw@p14s/

so a hint: it's nice to have templates for responses, to avoid making
mistakes in own name/address. Mine is for example very long, so even I
could not type it correctly...


Best regards,
Krzysztof
