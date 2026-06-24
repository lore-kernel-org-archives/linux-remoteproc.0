Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C797D2E282B
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301554; cv=none; b=OxnNRKQqgMM2i+4xPpFDu5vGql5iUtIT0IiR3b2izI7GVrumXbJy3rBI4CwXZ4RLGVTLG+byvKtebdLEGaVNf3P6fC3nPJvYw2ZYcSHrDcVk5jdQ0jSqZW9FltaqmvhzkPVBkvJhEJoDslyUjt7N57eabc/JNutExwdE2WItqaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301554; c=relaxed/simple;
	bh=Ng7sARmYi7p+GV9I8JUofY1Xk/cSGFYDUMv6MjUCXEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCJO0CzXudojyjB7QXRYdS/J27hlIxGINkLVmoeb33ygHhqz6f1hD84flcaHr2/owPIgMKHYCxZYTYr9O2SFKki0P3dy6PKuOmuE2h/QLCaxDP/6JVboZKpXdLaD3y3UD1Ukrp1wYThjaQ4pTGLZmkpP1FdggiJ4YMRJngyeL2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AueMYbaO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cm4WFsvS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AueMYbaO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cm4WFsvS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANTtr2501719
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 11:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjBLKK8bycZEhlSfsBuPgqxUUunAmuUeS+oktbJQUFo=; b=AueMYbaOtvtN9fQk
	neSYjVycOh1E1xMdLX7665SYaaU9OVYHFbKdehLJjzDYuvgrbuBglB98nJj8xR/3
	50LOF+kB4iITwUWYK70G4EQZ+/7AvmlBpzoCU+HXSg2vJlC/iyo9dv7ntcYA3vHU
	kHpF0a1YdJO5d1jdUJk0H7fRhz5mIhA5+E7yYe40X2z8yc31iK8+H5+3sEckdT2r
	9CsKtfgj9b7PnQ4ldbCQOMGLdZsH7jI4uiG/rPqE+UrR1gaWEkubGjUffP4MG4yb
	lm0FQNxpD2B8bdayUBcdGp36K3uLEgcvQpaY4osmpfTUnQ5SvYI3MmkDAybAK66p
	seTWpg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d450e5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 11:45:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517796be724so2071641cf.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 04:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782301550; x=1782906350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kjBLKK8bycZEhlSfsBuPgqxUUunAmuUeS+oktbJQUFo=;
        b=Cm4WFsvSt7zD1CouqHXAP8HODFGTh7eImWhlmlGvHCxco6oe54vL238J+kXleqPHIu
         sn6Dqfr48Uw/C0hyahzKnHjhy4L16cazb88p/h7szD8miFf+zxXPzPpZBdGRzTCo9B4z
         SEIGUx1E45ess05JD44dqG1KDPuCpY22uPUW+mWiRxHxur6CQ2r3Ns97TcgK6cdpCriL
         Oj/t4/FxhdR2ir1OkjqtRLrek+y+a6kZOrlu4zjR4srixsFuARFD5jV8t61ZvVqEcQFO
         aXLIJKW0udWfWn4eZnM9woGHfoZSqYf1VBYwqWh2CFAgCqLAbnzBC9EH+ndvYR25Jtfg
         eJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782301550; x=1782906350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjBLKK8bycZEhlSfsBuPgqxUUunAmuUeS+oktbJQUFo=;
        b=C4wu9JzmASVyFpuVj37b5T2zc57xSRqC5DNq+V/E7tD7V04VC6ZUqK8NBRwojMWlJw
         jsDVjnK9Y39xOTUMT+pVcPkTou7ZMnGZtiLB5BK23MjRmjb54sRYa35TrPtL6rFBOGH3
         IRgfoE7v/9/hy2IxzwLlLqio35slc9YHFIBodTh3+ku1IwjAjEwy2yyZ4odQveYibRf9
         CfywOsnMxljzaQUnO+VLbpb9Q1jvyJ7tqePXF5TyHKHFqBOwMAEBeKNqQJR+6LI0P5Zy
         RJ2bDLvvaDZl6jeIqZxjdR9hxEJyJCMLahIwYLBb5yNovpMeurv6BWU1SfGTMsNt1LuC
         p00Q==
X-Forwarded-Encrypted: i=1; AFNElJ+5eY03l8mKIDLWfli8ZkonjIRhJGZ8P21uBOqH9MSvR0VZZcGi8YrJHNfprCqzy+RWBzW6s1FsEnjz+17g3sIA@vger.kernel.org
X-Gm-Message-State: AOJu0YxgPnZeh2xHopfnv/nze1fTh/U2v1aWaMujqbMMrg+WLw7zWbj6
	zcdC76+af0F7yjkGiweJshn5lN6WIQ75Ce2mKRCTdufywU8HchNL8zVf7kkx5xhB1qUlzxvrxhX
	+Fhp7c0mbljCGJnVLh49eb50jyIDNInwlXQw88iRYVckKc+uYafwiVvBJyMO7h+zPHyJVc25X
X-Gm-Gg: AfdE7cmvRQ1ZpfpVyeMlZqTZ1r93l93o4YV9Z8ZQLhtgT6C82JfZc6c62KocS6C0Npj
	AgIlAp5Xsmh4lucxa06+ovspSPQbxyZ1FEC5hRmIzQLJdttek1m5l4CfE39D0mrne/4TbHJ0DGd
	roq24auMyjOKyY75aX5SbLKzMJWXRMvz9WFtYXqF4VwskSGplSva+Ebez8IDXtBOuAOvAvxdHM9
	Bnuzwq0Sf637MGUTlxrvPu7kymZn3TZ8XO+OcDAKwrWT1CaxVE/+xO1aIHkIb7rClkHK/blcT72
	Wg/FAH1X249+0d1Gw9dR1naaJA0zsEjpyi3heIUI9UfjXs73jUnXevQ6q4FNFolHYSzk6lMYzYe
	KVb07EDuEoNVgHp84eJLsl6Npxgg5qvlknLY=
X-Received: by 2002:a05:620a:1a1f:b0:914:ea37:6f14 with SMTP id af79cd13be357-925c6576fd1mr912772785a.1.1782301549941;
        Wed, 24 Jun 2026 04:45:49 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1f:b0:914:ea37:6f14 with SMTP id af79cd13be357-925c6576fd1mr912769585a.1.1782301549508;
        Wed, 24 Jun 2026 04:45:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e5280sm655824766b.53.2026.06.24.04.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 04:45:48 -0700 (PDT)
Message-ID: <b874a5a5-ed41-4521-a9b0-40d9bf3899cd@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:45:46 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] remoteproc: qcom: pas: Map/unmap subsystem region
 before auth_and_reset
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-5-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430191253.4052025-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5NyBTYWx0ZWRfXxEA1tgRgZBct
 jugew/DPyJkZ/EJz8lTfhKMwX6L1eI7omGMnEiNfMekmgqtihPlh5RJnD+vzQL9uuRbTaD8rZpT
 9D7ptjZDRbuW5kbNXSaxod1m5DsrI6M=
X-Proofpoint-GUID: W1LWwLeiXu0S5NxzGigeW2uFifyOblM-
X-Authority-Analysis: v=2.4 cv=Ar7eGu9P c=1 sm=1 tr=0 ts=6a3bc36e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=h9zVLhnXF9m6a8bq9Z4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: W1LWwLeiXu0S5NxzGigeW2uFifyOblM-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5NyBTYWx0ZWRfX1XX3gXj16HSU
 bXkOUkTfeupqU0FLb9M4phXUHOFZwrek96wGzWx8plIfX0TKja5YY5u7TMvmlD/TrDF4lSdNCfX
 egk4hKFdj03N9hFAd/9kAhC1vrZc821UMd2o0prfgFHY9up3raebUzpoGu96dF1W9UcHq/hMht5
 K/cjSVpnScbtpIZ7BFSBR1b+AuW1X6JXU5eqLyPa1RYyHHiYUzINpxaOenvwDb0E9voRdgLFnx6
 AzUdV4pWCkpICuMXCXKYZ98riV8TqpvUDTTXCjc7dRwdtmF4VlHDiQKot4FNK+thdSr7x3NphNm
 Y0kVLtk18OxXYX+In0xw1NfIZu34N35f0joB0srXykB4PnH5dC+OxzO5fR+XFwq9Q2TKymYtiIM
 fj/FlyTbP1j89iSztssbb5M7A1KNdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240097

On 4/30/26 9:12 PM, Mukesh Ojha wrote:
> Qualcomm remoteproc drivers such as qcom_q6v5_mss, which do not use the
> Peripheral Authentication Service (PAS), always map the MBA region before
> use and unmap it once the usage is complete. This behavior was introduced
> to avoid issues seen in the past where speculative accesses from the
> application processor to the MBA region after it was assigned to the remote
> Q6 led to an XPU violation. The issue was mitigated by unmapping the region
> before handing control to the remote Q6.
> 
> Currently, most Qualcomm SoCs using the PAS driver run either with a
> standalone QHEE or the Gunyah hypervisor. In these environments, the
> hypervisor unmaps the Q6 memory from HLOS Stage-2 and remaps it into the
> Q6 Stage-2 page table. As a result, speculative accesses from HLOS cannot
> reach the region even if it remains mapped in HLOS Stage-1; therefore, XPU
> violations cannot occur.
> 
> However, when the same SoC runs Linux at EL2, Linux itself must perform the
> unmapping to avoid such issues. It is still correct to apply this mapping/
> unmapping sequence even for SoCs that run under Gunyah, so this behavior
> should not be conditional.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
