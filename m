Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CCA314A7D
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 15:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763999626; cv=none; b=ddlC5j1gub5qkB8OWUwKivfXodhZizDSOCTra2Z5e376reJv1Vo+FDfEZVjWkUZzKL+yLyx6SZwT8rYmhD+egJjYIKTK/1vklKi836X7DChS6gdzOzLXXvhqbH7OYUZUwHt4vljtr71wJdTLWq6OYObwcOE3f9fr+WxBvVeM/6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763999626; c=relaxed/simple;
	bh=apeR+6JuSlimj28Oe4oBgpLM9V5n83U3UdyhU34El0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMCeqtOdouwY3X/NrHpAQmIV7hJOwKQf42FohgjSPLMAdR5tr31cKF62xxLRZMizqmK6K1U9gNzw2uHakyFjqmyHgM4EEQtOcKDUHTQZ87lqlhdPhtN68vPi4tW7OZEiUKjGEUB5g2UKskkmpyRpiGZvlOK2UwXBX2xd2qaDqOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmmoEyFx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OfR7/b5b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmmoEyFx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OfR7/b5b"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOB2sJY3884524
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 15:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lcUfwtPY7I4dq2SqD63B3hhl
	sbHh9OxaMGpG1z80cTU=; b=SmmoEyFx/TjdE4OMgwuhPtdGYepaygrPdB8T9VTT
	c8QPAw2fLeaYT3Xxif+6sGfFYmNi84BqOoLyjzvjZ3AUDbiVpIgh7io+/Sty8Nnu
	zAHWLUcxEw+JUym4YG7Qrud1qhUzyvrlP00cpZBDeGwhvpKlJJL35/a2OZlYtklU
	fy/JtVk2zbTUrODFpJ408r5pckm/VWtANbwVf30Lr5qPBP6SpvZPFv0CDsY94swX
	f8JNbJ2+R/frMTrnn2YYoYswbinLTHfa250hw7BbiS8b4KHy0MROXLw41IeZ996G
	ziyavERP4WG+/eDIMCdwPsrc+iHClBTqvOd0xunbvycSvg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amp568sdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 15:53:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3436d81a532so8882703a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 07:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763999623; x=1764604423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lcUfwtPY7I4dq2SqD63B3hhlsbHh9OxaMGpG1z80cTU=;
        b=OfR7/b5baYsfsUQZxLBOyh+2CxTRWATfwzBoNZ9N/2G5UZY2Njr9H9z4HEAfMtoqP+
         swfcJtkBwfrgdRQ6Lm+wvkcanUMVkvTykXshZplNigF3iUg/ec0y77t3AG8ayt/awagy
         gX/4Eg0lKWnVr4B7DW3z5BwM7luS6QSnUd8i5yjUpgg00ZLpxl4vY4ZKzkGeJGT8FeOw
         Z8INuEeVtulDld3VqSl0DbqsCrlIUca+l4xANqcqtXVOa7fgCTPJClLT6N2EKG9BFxxe
         Anysh8eNegh+/K2h8NtcSuPQn/L1JsJQj4fdOrApNX8RIjLnjgH6ZxMdWUruT5WkrTFR
         s4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763999623; x=1764604423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcUfwtPY7I4dq2SqD63B3hhlsbHh9OxaMGpG1z80cTU=;
        b=FblToJkcPG/RIee/hswtdpdxiJuMVGKKX/KgAnfSjO7dbVbivPB4o2esbAEKDf7Rk1
         EmgYYdWfWcuOVgmOBxwAE9I767iOOIQjkuTGZl+KfoKPP5p6fswLP8HKBONYVs2jhEOD
         aCaSzmElEeTEdR+11KRK8muM/NziJkEKxjmDeFK1ySoqKHbsUGPg4U6/wcv3UNUDXx3d
         bZcPGP99zBNp0927NHTStygSkJfBSoQaY3XHmZgGDOK+ASNaZVqmt3sQzm9f2MPutO7s
         gDnrVqpCBz/R4LqP/OBF2U7Sw5aHsFkm/WilNzYzqthkvfAX6uo88x0S/AJr8PnYxosO
         4yuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBczWB1/jkKM3QB1jDjnw5RtltYFp6fKpAA0dcj5PsoHxTfAqBCdV9uZBsSlboNCrK2MRU0e5JfEsFfvPvF9+5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxb2ACQavigUDeOb7J/B2z4PADGLEr16gb233pLckTRi102j13
	WJshxXZjxlI6LaQHDU0rGoY7pIqMBaPYBxGJKprqSU6ufwhFWnfjOvPMZ5fPbOsbbQmEra/6jVM
	iU17DDcyvH/eSaqH0zDwted6dBp2Y1Xi+FI6VyUgf7f0feq+naGaCxcMD0//Ip/vt2EVajnTQ
X-Gm-Gg: ASbGnctZzJ4eSZs7WfiDzENHN3AHguTKo3gU9vmFQG8/tJwxUtM2arpvAam/AT+zIcW
	s6Jn8NOp4mhtRGLAUpZC14n0wWgI6FxZnXAyMxz63Mmln0pkIBTZ6Zmf+bTfmcWdX1qCuGhKtM/
	+Vct86xYTFIlvZ1W5TNWdZjuBL0N0F/t9rSvipOu0eE1IE0yMFIO02hZcU189z/6GkVCNqw2jJm
	nYlChsJ2Y4A8jJyYaAystGk5a+KgXZryOPahyfH9O/E0ZbxPh3919cRpeQmhCXrUpZ3slizLG9O
	V/X5UYIdFloDJGlamSJ8al/N21bw0XrjySJqi/gL9QcERUuGjam7W/XlD9CoXxiWTGCGMabpers
	A54ls1HxyqoWnhbMFfd+IljdP4sWjlNHiBU62
X-Received: by 2002:a17:90b:48c6:b0:340:5c38:3a56 with SMTP id 98e67ed59e1d1-34733f5cef1mr11983280a91.37.1763999623306;
        Mon, 24 Nov 2025 07:53:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpyUmJzIx88EvSZBo3rN3kdAqiVkHc3BEVZBVRfdX+do+UkkNHg6B1NeQz2X4n+wL0IvGJqw==
X-Received: by 2002:a17:90b:48c6:b0:340:5c38:3a56 with SMTP id 98e67ed59e1d1-34733f5cef1mr11983248a91.37.1763999622671;
        Mon, 24 Nov 2025 07:53:42 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727bca9aasm13807991a91.3.2025.11.24.07.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 07:53:42 -0800 (PST)
Date: Mon, 24 Nov 2025 21:23:36 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <20251124155336.6b45ddgwc5mh6q2y@hu-mojha-hyd.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
 <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
 <238adfbb-3773-4318-93d3-b23697aa4b18@oss.qualcomm.com>
 <20251124064558.aaartbglgvcj7w5r@hu-mojha-hyd.qualcomm.com>
 <5dc2f787-56f7-44ca-89b2-754a0c46a1dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dc2f787-56f7-44ca-89b2-754a0c46a1dd@oss.qualcomm.com>
X-Proofpoint-GUID: ygTOoFbcpOjLyg2Za5hcTqOIlcrcTAaO
X-Proofpoint-ORIG-GUID: ygTOoFbcpOjLyg2Za5hcTqOIlcrcTAaO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEzOSBTYWx0ZWRfX6aCWmxH+kwro
 7wUapVM1uh9Jr+a8VS1rJXS8DGJ7DVBglI0FePrMk/T4GIsLvAXwEFwgA4DvCrrjyNwYV6396mi
 4Naiii68qwplv3L1L1ZeA5GkhSR25LU0NRTM1lNZgtoBqIPbje4pfC5okJALdE3IC4JNTy/iS6r
 9DSrMAJUmDAytJaF6GWrw0sb3VdrEd67XKOhJRnIjyt3LFnOnD9dBmcpY0W+UqwarcKfAfH6sGx
 dDk5ZyNVej5Nf0+gcMwwsusbP73qKVxMohAjl+eShts9+fBHh/Zz6n4n16Rls9EMznQ2KDG8h9m
 YYfgIqQkaQnPqttHEoIHyGM7AdVJ2UjFOnYO5pUzwm7EoF6OSmHJAlV7Qco6VEVX+TcvNFucuwH
 RpzBWZwmEA49YlS45nkzXLMlhxd1zQ==
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=69247f88 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=zU0Ex8qXXkjpmaSxHigA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_06,2025-11-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240139

On Mon, Nov 24, 2025 at 12:33:47PM +0100, Konrad Dybcio wrote:
> On 11/24/25 7:45 AM, Mukesh Ojha wrote:
> > On Fri, Nov 21, 2025 at 04:08:36PM +0100, Konrad Dybcio wrote:
> >> On 11/21/25 12:37 PM, Mukesh Ojha wrote:
> >>> On Fri, Nov 21, 2025 at 11:27:57AM +0000, Bryan O'Donoghue wrote:
> >>>> On 21/11/2025 11:01, Mukesh Ojha wrote:
> >>>>> In May 2025, we discussed the challenges at Linaro Connect 2025 [1]
> >>>>> related to Secure PAS remoteproc enablement when Linux is running at EL2
> >>>>> for Qualcomm SoCs.
> >>>>>
> >>>>> [1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> >>>>>

[...]

> >>>>>
> >>>>> Changes in v8: https://lore.kernel.org/lkml/20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com/
> >>>>>   - Addressed suggestion from Stephen which was regarding commit message(9/14),
> >>>>>     debug log(12/14) suggestion, and return type change(4/14).
> >>>>>   - Added R-b tag on 10/14 .
> >>>> Sorry.
> >>>>
> >>>> Did we actually come up with a cogent reason to omit the video firmware
> >>>> loading here ?
> >>>>
> >>>> AFAIU it is required for Lemans and Glymur - leaving it out is blocking
> >>>> getting video stuff done and storing up trouble.
> >>>>
> >>>> What exactly is the blockage - is it something you want help with ?
> >>>
> >>> I replied to you here[1] and given my reason..till something concluded on
> >>> "multi-cell IOMMU[2]", I can not add video and block what is working
> >>> already.
> >>>
> >>> [1]
> >>> https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-hyd.qualcomm.com/
> >>>
> >>> [2]
> >>> https://lore.kernel.org/lkml/cover.1762235099.git.charan.kalla@oss.qualcomm.com/
> >>
> >> I see that the following files call qcom_scm_pas_auth_.*():
> >>
> >> drivers/firmware/qcom/qcom_scm.c
> >> drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> drivers/media/platform/qcom/iris/iris_firmware.c
> >> drivers/media/platform/qcom/venus/firmware.c
> >> drivers/net/ipa/ipa_main.c
> >> drivers/net/wireless/ath/ath12k/ahb.c
> >> drivers/remoteproc/qcom_q6v5_pas.c
> >> drivers/remoteproc/qcom_wcnss.c
> >>
> >> iris is difficult, rproc is done, adreno doesn't need it..
> >>
> >> would ath12k_ahb or IPA be affected by this series as well?
> > 
> > Yes, they would be affected, and the modem as well, when Linux is
> > running at EL2. However, I do not see them present in any of the QLi and
> > targeted compute SoCs at the moment. Therefore, our firmware does not
> > support it yet.
> 
> Hamoa's little brother should have ath12k_ahb.. and I assume IPA is
> present on at least some platforms where there's a modem (QCM6490?)

Sure, We will add the support for IP's when there is a need for SoC running Linux
at EL2 (backed by firmware).

> 
> Konrad

-- 
-Mukesh Ojha
