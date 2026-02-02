Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A5835CBD8
	for <linux-remoteproc@vger.kernel.org>; Mon,  2 Feb 2026 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029845; cv=none; b=LRMtv6pDAaj0X0eCDKlzygTae2XnQY7LetJB8TQVlC6EImZx9IBHciLkTNErLHzJKmb329ZGGZc2gisWAQnrVPNgfS+kpawW+71H5/Pc40ilitkXu4EEEpvImKAXrR/TDoediPIf0HqzY5beDFrJpov+Mc87D4CaeVXrr+jZLfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029845; c=relaxed/simple;
	bh=TFTxp9Whu76WPWc8LoRr1IbswWOT2EZOfWCEsAXG3cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=muaZ1HChRcvp6Wrs8bVX5ydDAdn46iIlawg1CHZrwkg16ANS1pvN+sQrWdGdMO71hA9V3uDIu0K6cAdTWdnvrHBr/E2tmeCTm1uLo9H6gESzmf0eQtq3fwMoifwPN6nEbiYZOeOLU0HF9hPSPIyE0me4eveeoY9GqYTGyW21Cwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dpt1V3u9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPTVHbo5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dpt1V3u9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPTVHbo5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127mBtE1305623
	for <linux-remoteproc@vger.kernel.org>; Mon, 2 Feb 2026 10:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UuulFgRx9rd/kvUwhvAhL2lf6p7QUWW0dftJxb5MCVA=; b=Dpt1V3u9rKUpY5Oi
	GIjOPuOONwb0nuY3VNAVkxQHYXLsyznSjcYRh/g8lQmTfq8Mft9pVlCt5jsoOxFo
	RFH2Tya5hatwejqa0yztCYXi82sGp+Q/9C5NFJXRtQWiZY3VcuJrJJ7k/jhTLlT8
	uVbTosc1f7IGFO5gz5p47UG0DyX6w9MgenSLUOs9lalDMPCCChdc3//mvNVu3Tti
	kdly3kRD6R1IfsXWyJ5KtkkYrmWnIbLF+BxttNFvUNMvlOFG9Cek7GZP/qDYRVpa
	uOu4Gl3u8IWYq3Ro4W+nrenvnls67qtvuP2iQVLgc/u3g7ML0x5bHr9uQ0AyA9hn
	rZ5Rjg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c23h1juqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 02 Feb 2026 10:57:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b48c08deso70504485a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Feb 2026 02:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770029842; x=1770634642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuulFgRx9rd/kvUwhvAhL2lf6p7QUWW0dftJxb5MCVA=;
        b=fPTVHbo5wUOSfOKVziEtvkjOMOzbXeQDw9tREExTRWFiavEyDUCN0vWQwmo+oVajqZ
         PGenC8zewOi/jvtDoyXo345xS6JtP35Xa6ohAmTOqsAmnLb1WMmnyo2hrcq/Argb2ZWC
         /IktTUWd6gKlsFzPdV1JPSxTLWX2T/0/GAWfMJ1n/ifgcRaoEjGeL1UYMNK9idu6aPuR
         hQ4R0Jp0pajoSYkPo1uBpJXZdacjNlefx+qB9Qy9n3uK7WWYrACnZww/pXUR6C+J3/rD
         Ml758mhJfl2nu+b8wgzfWuNuTbdVWlYgNZT0U82A3LOoYMTijwgnOzN3/d7e7lMVb4WR
         PUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029842; x=1770634642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuulFgRx9rd/kvUwhvAhL2lf6p7QUWW0dftJxb5MCVA=;
        b=g6DUQA4AkYUEhLMVdIU7QgqW8ziiRNzr8d6K3/JIT3OU2eTA/50+qab/Sk30OxoyJL
         hek31incldPQV2FJEJItoaqgCXT5E6Y37SwExwFYojOWex8Cf6oq5mmKOOelccZngaIn
         bj/GhJhfqIQW4v5xEch4YAshlAPYCkxNxu7SZ8QjfHTVcODS74xZPxymHroGNyXzGNLL
         TVwsvGL0roKRv23EazSDQPzzqo71ws9ch3iILwgx9rYynCDdTPzBmU0hXb8AUbAZBIDJ
         H+SeC/ZNlf5+KOsmECDfZnFeySPcF2wCAM15sILF6Sqbq0aBtc/SO3VY4/nCGMKDk1Xa
         44iw==
X-Forwarded-Encrypted: i=1; AJvYcCWMJns/p7eV2fAJPMYeyHumLpT2PGpGLhVTBa/HEkvsHHbbpvskVY161OWGa9RgVMDzEY24encSBytN7Ywms80q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+nlYIJ9imNBR7UW0RMcR3P65kFb2+h60IoPxgOU7sLVjPPmwA
	aEguiIccVh+T87XjaG5mnt60vWJyhc45+tOQnd/rK8r/DUG+SzeyydI+cRu0s678jwkbKv7Bmaw
	O8kazL7JDIK3aqnKcPtkGQ8IdFWjJeXUQchkrsvKcw1NyITm3SQl5tYR8crtdOAyBcfOhTsUi
X-Gm-Gg: AZuq6aLSwBJ1ORxZXZHEh0J2hBjkWXCJPtfAmweqg4AGTx/FY0vZNTvWWFx02gf+/pW
	d5IGLtFhzFtA/EyJYDmFfBbi/479JyH39kX4M6MplY1A7jAJ2A1zFOhQz4WAdaVBvP+keagVoiY
	9f4OTEyj5W50WXtsllNU1Q1NzZMRZHMwBdJX32MwXLquKwayCPPY8G4d6R/pbxReuEzSDIl9+mr
	hdDDW5QPzpblpupq05d9FpCf0wuGDJgQ4uIfsigRMa3bOh1QMEHdCAMAiPyXCJNfNCNZAsM5ppo
	Ss1P5EDsjQ2Hq1N9zzSWO/yIPsmQlcFAgE+f8at1EuILIGO0eY83Ukt4ywXq2Ov/M1Pa/torWar
	MTGdKdkOO9oFghx1Rhz1l37w0zr6TgcF8UZlkzNzzbBk5Nd+kwTYWhJhXjXmSs52EMdw=
X-Received: by 2002:a05:620a:4141:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c9eb20cebcmr1085527285a.2.1770029841909;
        Mon, 02 Feb 2026 02:57:21 -0800 (PST)
X-Received: by 2002:a05:620a:4141:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c9eb20cebcmr1085526585a.2.1770029841519;
        Mon, 02 Feb 2026 02:57:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf183ccbsm843100366b.34.2026.02.02.02.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:57:19 -0800 (PST)
Message-ID: <9b4ce86a-8529-4c55-9dcf-caecf81e46d8@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:57:16 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: qcom_wcnss: Fix handling the lack of PD
 regulators in v3
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        Luca Weiss <luca@lucaweiss.eu>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, llvm@lists.linux.dev
References: <20260201210230.911220-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201210230.911220-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m6jwh6h0pSXmzWfKjZUjZ-de4q6rS-fx
X-Proofpoint-ORIG-GUID: m6jwh6h0pSXmzWfKjZUjZ-de4q6rS-fx
X-Authority-Analysis: v=2.4 cv=Fu8IPmrq c=1 sm=1 tr=0 ts=69808312 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1XiK3UaZtGXvnlVxuGgA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4OCBTYWx0ZWRfXyIMQuAYbkCLu
 eTSspBCxkW/OdIkc5ynx6t00/Qjl8sxcMxBZtPIBg1AIp3Am4EugesGXw7ytItAn19wCtH3vYXD
 UbitOXP5x0/jFoIizWkxSbt+Mi/6RzjRqN0Tp5EhlAbGX1aYiMmbCp1S6a4p5l1cTbNTMvQhrOb
 o8FPajw9QVO36UDrpQwfYmbx9i6gxG2dz8TyHG9teMfli7zZI6QkQKjqpBH9VRC1kCpT1j0ClQ4
 JnoidrY7tNSKfSOI+HdeTict4axDEomjb/wHlKqb3qhucL/CbztddDHV0sV88dVDSx02HXqTucl
 KTLJkjZXmmOzY50iblGSzqo+oebq/okAo53hZ4d7Pjjdtdh7OpDquwLsZ7cPvU+kzQf0OFDLoOF
 nPf0H2oS1KD7sDIySsdBC75nCW7rppYRBTm6IHww8VcCXZeZTf3lg6ZaNnzdVZPw2XZDKxaKKZN
 uhJUdlnDdI3IviXBlgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020088

On 2/1/26 9:55 PM, Val Packett wrote:
> The changes introduced to handle single power domain platforms have
> swapped the info pointer increment from num_pd_vregs to num_pds, which
> would shift the info pointer past the end of the array for pronto-v3,
> which does not list power domain regulators in vregs.
> 
> This showed up as a difference between GCC- and LLVM-compiled kernels
> on SDM632 devices, where only with LLVM one would get the
> "regulator request with no identifier" error, because the out-of-bounds
> memory ended up being zeroed. Fix by skipping the increment when there
> are more power domains than regulators.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
