Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF29372B25
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Mar 2026 08:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772700070; cv=none; b=qmS1fZ+sv6B29T8u9B8zRBizlJoeUNti30EBlzyJGvc66XR5/sIQJPXLAv24WvZoC7r7C0VECQj8Qj/Z1LqYrmEpayuGDIJnPMxtacCnaSWZzLGztzxaKEbtPiKrykcmv5eRB90+k2esJ/2WQNPMAc7h1EDMbSx33i+V1PDMzY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772700070; c=relaxed/simple;
	bh=2XfN1IUdVDHXRnPcZX29DDqK+fygGtG7P2u+RJeGQZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUi/1HLq0k9u7Gbt+/XfAE5lfDjUE6JuSlRZW6pkLu3duKktnE/B8NaLu/70QO5xX3x+BMPgT37OqJDX1Htk971XCTft1jaLz2+g4+qInY6HwrlMe2489hUL5UrR7aTTlglmyslIGU9oBSRvmBcCAz8vYkZSUbkFLJ0nWCeibOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PV1zd67S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a5JH6qXA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PV1zd67S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a5JH6qXA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BlWP3604191
	for <linux-remoteproc@vger.kernel.org>; Thu, 5 Mar 2026 08:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	piRd4pArnPlFES3z5bGfGAc7MxY7XKet73f1XaOJtCE=; b=PV1zd67SOSKF+UZR
	V5fdwqbyUucXumd06BZ/oAA37dUEl5vML5IHmI3mnn4Bmki8QO3evnkI46yjxxGS
	m45CAGu5eBDMw2YB/8jIWojxuj4hFNgf0+OtRvrgxln0h4SEUJdTQ/aCob5K6Yy2
	yldtosQxZLDKpCc9FgtsieLz7R7I4Tsoz3rcYZinQF78wsrB238y/92ii5jn51JZ
	AwdA78m4ieR/9zsGxFByvyfoHc/1zatdcLsswZYA8mS6Zh9fYsgTO7KlJNmfRS3/
	p0NvKqVEk2wjuYVZ4VzeLo6dqMWQINNS4A0/DL8PndXOf5bZqmgVdZBfNE0dCkLb
	DG+FPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wafvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 05 Mar 2026 08:41:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb50dfd542so577220185a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Mar 2026 00:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772700068; x=1773304868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=piRd4pArnPlFES3z5bGfGAc7MxY7XKet73f1XaOJtCE=;
        b=a5JH6qXAIYQbBP3toEITk7g6kbpqSzscG77TURVQ9U2/jL36f4jpwDQoAcWZFEM0Z9
         Mg5AxbLtj9EKsG0r8IfgiJinwa2IvcqNxk4GdebnFnkfZD94CtU1g8epiy9nCpGcOIN2
         CX0tC2AJNXPLqeAb1c2neyq0FkS3kH2H07txuMK6lbIQHmEYLh+M0TBTlMgVUxJiXS1Q
         5ply5XADtcdcMt7taIZtXqXfBU5lU+1sSPt46Zp0nJx6mPFfHXKIb+Eikz9DhM192i65
         mrKJizymYToQSpQarX/PU+WiwNSguLDmCohA+pBBK+4lV+HN8lGyByTx4pfaMZ95LJ/S
         RDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700068; x=1773304868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piRd4pArnPlFES3z5bGfGAc7MxY7XKet73f1XaOJtCE=;
        b=h36suZcfhjKtDPwp8wpOiLOy2VtI4QZ3Bc2j46kComoI9Q6bTWuli7geMg2bxYWESH
         VVNMyQnSaTbtcwWsFUdlc3Fk0P1xcv3g13uClQMwPCmd9bQHUe/sR3VRZSOEr2Tl/v38
         c3Xy2ak5TkZVTMl0oCqh66B7LdkedhYZK/xYNM9xcEpa3Sv+8oWvs9Ntv0Bcq56gkk1b
         CHOxI50yGT29HiYUfuX8I2MJ4XcE6p4GDbQBw0Mvp44WtlTDC6uVoIhTJXGSvGpq3ja6
         DbvpZupHES5EkRjOLLl/ZdOhFOtVItDfunPdOn3goCnJQ7WWsCkW9WWndHyDXB2iHPm2
         8j9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnb6O85e8QTvMYVQlJuqWFLv2H0GOYu4LYnhGf688659piQ/9TYNn11FneneA7OoVkboDUYzg8Eo5AjBr0bnv3@vger.kernel.org
X-Gm-Message-State: AOJu0YwGnljvUw7OYP2tuxP3SZbzE5TeORB+av2J9e2H4KSnwVlga2Cu
	902sadDaT4Yql2ECKNUV8ytzUvVfoJxk0FIwTti76BxbL0WQN73sxTXbVNEBaS2baQ/POzBz8/9
	TNwHE5pVvtDQ/Q5deHzINJYyMFuVx8N68o5NYAEYlFekkaNNfDpTScnWCWNxX0UX3mYVlXNnl
X-Gm-Gg: ATEYQzyfaIbUPuiTveZmk7Yhjj2ZN8shSWvP219VWGrt4PsgljcQ9Ss13ZTto4zY5lx
	gNaicxdIPbmJxVl3n/RYz0Ee0Gg3te9uj2nvAaPh0HdiHgVzTIXIFrYutG2Jy60V4YvvTWsEtjp
	yieFC9l/u+w/uMdjHXzW/lf5Z1SsuK8DFv8L5JA9oOt8yezFJSC0F78vGeJ2dW21MMMKQpJfAGH
	4aHkAn/VTW29BcHOchWCZJdzEP/IhvBK9GQPoJhFMo+hAvFm76I95ROqWYcVXwaQMXBZCQYt7+f
	IM6lWkJU/ccOYVElNLGTykGU8lIaDXF7dqruxw6q94pmX5k1dFtZ03CBeNaxq1Jx1HfFmkKdTc7
	ZU14WdhPFtMcVXDxSdc5ghZiztgl0FTXSOJ3Ms6x108GItHOfTbk6TS0H7Mq1osydlbiCzCaPkJ
	7ehuI=
X-Received: by 2002:a05:620a:28c7:b0:8cb:3872:bd62 with SMTP id af79cd13be357-8cd5aee64f2mr442981985a.1.1772700067627;
        Thu, 05 Mar 2026 00:41:07 -0800 (PST)
X-Received: by 2002:a05:620a:28c7:b0:8cb:3872:bd62 with SMTP id af79cd13be357-8cd5aee64f2mr442980385a.1.1772700067211;
        Thu, 05 Mar 2026 00:41:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66157d35cfcsm394173a12.22.2026.03.05.00.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:41:05 -0800 (PST)
Message-ID: <dea45e4e-aebc-46e4-a245-3603da1779f3@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 09:41:03 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] wifi: wcn36xx: add support for WCN3610
To: Kerigan Creighton <kerigancreighton@gmail.com>,
        linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, wcn36xx@lists.infradead.org,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260305003253.1022386-1-kerigancreighton@gmail.com>
 <20260305003253.1022386-4-kerigancreighton@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305003253.1022386-4-kerigancreighton@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: H2Rg6GPYJgrOfcH8V0p9T_G46DGK7leP
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a941a4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=teg4DUnw7xCSCHTInWMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2OCBTYWx0ZWRfX74nz78uPJZsE
 x8IcW449qMT0RUTnf+xG8tgipfDijN0PJxKEjqtSgAKr4uHCud5bPG6Hkb5esDymkmom2cQL904
 r5whlP88r+pnoojmeSWfRgZ3N4jbt3c5wA/m+tB1qGgXBsfiMbCm82RwcKHDTs2Gv3BDRQPLsGM
 bkRGM4ovziovaC3K48Fhx5jBklzuCa68sZDkoHMEj7d9s+BfRH56w7IIYBbvqCZsW11KpK3/7fF
 hmvNT591Zn+kjPDXT7q/00GppwQ/eWCE0ubFh5WQCE0RCGZH/CRuHWqQsnqppIfoAbho1HDze37
 wMZ2xYJ2wvvTzmtyoIFEULAObgeR4E3wxmgj8PiokIOr/zvB4+QIDdwUuAGiIjLLIcDG7xU4oAM
 pBDrtTxzmRi5t1wMwgLBp0FyGoE8PSVm5HBkrll8xnvnYOXk7GHQzcuWmJPmqLV2+pTtJRh/zSX
 3W31/GyMprGxbrVcORA==
X-Proofpoint-ORIG-GUID: H2Rg6GPYJgrOfcH8V0p9T_G46DGK7leP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050068

On 3/5/26 1:32 AM, Kerigan Creighton wrote:
> The WCN3610 has a lot in common with the WCN3620, so much
> of that code was reused.
> 
> Tested on an Anki Vector 1.0 and 2.0 robot. Support for other
> WCN36xx chips has not been affected.
> 
> The WCN3610 requires specific BTC configuration values for
> stable Wi-Fi. Without these values, there's some packet loss.
> An extra CFG table was made so other chips are not affected.
> 
> STA_POWERSAVE causes firmware bugs (long hangs) with the
> WCN3610, thus it has been disabled just for this chip.

Is that something you've observed, or does the downstream kernel
mention these issues?

Konrad
