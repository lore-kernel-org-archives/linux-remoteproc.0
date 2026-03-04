Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7352F219301
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Mar 2026 23:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772667951; cv=none; b=CwgQj8zjLIA31GnKeA/yXFPir6xl38LSTsm32tQ+SHKvHx7tqqxiQiPCJDQiWZ1VpG8omLMphnEtM/dMv/CR5FZTlmZqR8piqPmphIzPHnNlMT2Ki+63AvOgpNhUDWrikpjSjc8QjhndlbLjWVqxE05X3MsnXJvYrWHuVZBW8Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772667951; c=relaxed/simple;
	bh=+1Y7UanKRqGrvnoH5Mr8xrxROqIOcpxOCtVT08BVbBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roigoaOcxyLQ8ONh/S/jVWaAyjzacbBDpGU1xk8WdKOc3XfCHJuXbykTm4qy3qH33Vkz4fGdz8tGUphunkdXxAiXL0ZRki/na+jCwIBi5rQ9AzgM2cFcf4eerWWaIXwHPKeFvwnmRNj/nG1EaKj/MrP1DLwhHwYn4NPItNeYFcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h9Gx7KQ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lo0XlsEi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h9Gx7KQ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lo0XlsEi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624KL3o03615092
	for <linux-remoteproc@vger.kernel.org>; Wed, 4 Mar 2026 23:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eTiPgJ8p02jTHd5/lFpc8tHF
	aJ1hfSTayk+CcTaAXKw=; b=h9Gx7KQ4r6FzcVz8fBA6lSdebKOPz9oKzFpTIK8U
	HSuTXWIa8HLx3Vgjo2JLhzPWLIt5k90wjP6C95E9PqUnct+hywvLbzyjB533mGpX
	J4H2Ef0y1oNWD9Az6mGdjf/itjMYLWL1T/H+VCKdWZf5Eiia16Vdz9IFTc6vkSJB
	T1IRAz7/HB13TT0uelhouItijGo4ZzEud87fQuLzrOOq0DUP0ACSdklAkRYtABCP
	gJ8qrrQjgFmlGkr246amBryvS33FG0EFpqRje4JcAqP9nc9eTV05z63Ta0RORexp
	xWj6CBFWLfrsctP4isZ+fXcf8nM/L1ozSzafuEgp0/wqvA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptgf0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 04 Mar 2026 23:45:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70e610242so1331061485a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Mar 2026 15:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772667949; x=1773272749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eTiPgJ8p02jTHd5/lFpc8tHFaJ1hfSTayk+CcTaAXKw=;
        b=Lo0XlsEirwdEtwfvudC6JuL7uo+chEOKZ9jpiuo5vbdXILIEWiSTOSdpTvMYfa1Ems
         RYCswyz3cUYktz9KOdSroUYIkHJVAJejJHsdBy+lqtEQS8kLlQMjfpqBfEGKqNZ06JAp
         oHmuLZaDmjcAHjiVRzAg905PEPvu3/qQPDdFrJZppXrBERE5fJbP5htDRfhvVWSRSmIw
         7+NSgkHCaIdYkrcAE5EkX8CrgUI8pq05mSthiooLv+iw760H9G0VRNp82+krsz1jkAf4
         fhz+5IftffuspQUHKDZ0mr45qZ0gAt7AAvbWrNSZgtMJFqlpSqY3jL9lyVNshBKG1ihd
         3FRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772667949; x=1773272749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTiPgJ8p02jTHd5/lFpc8tHFaJ1hfSTayk+CcTaAXKw=;
        b=wE2t7gFhDgnE1FzhrwnGFS5x7d66oIIp7pB0iOG88g8ALI1+wlOcHy8QjazH2pk2ni
         F4wMOA+e4VzNqIqMuOwTyNA+IfAUI4FOYu99kmKYUgaZQ+ABy9UoYlZCJuYQl34acQ/N
         ZdIYOdpj3M9a2PD8PCU9Dj5SHR8vuJgDom0Q+G6wzpThpMg/nxFvTAN0rGTxyGDN/jfe
         1HZhWiO4EAao0xZfdxx90H6iJ7leo9jUCPlipFOzZ+L6WiUWduIiPcTmA8j9SjiGqKen
         vCuJJnEwJUl5LJZB3xB6VGKaX1+soDWATtNuqnfAoTcGBR8MfyFVHeSRBC6FEyzqShMA
         XBCw==
X-Forwarded-Encrypted: i=1; AJvYcCXCCuQk77pGJk2I75aS/uJvR/Is9IwwtLEeTclVwSCcFtwxAuEflbs+DK0D20NAMX+GtnWyIL87x9PID7vu0Jek@vger.kernel.org
X-Gm-Message-State: AOJu0YyRTZUvdFpo+SvXs8+ktyoKODRnaGhKO9u8/yhgRD3w4LBxu6kg
	2gNqiFlucXUdiRjCzELzvAC2MAviq4Q8yoiZYp5PZxbDyEtdtk7nMCuVVEDPvBPkTtr0lIPDUrZ
	AmoY7rqiE3OouSvytsiRmIziiRLsZjnvmmeT38cWWSluAe0TExi6q8b6VUoIUEbTrgy75fO5u
X-Gm-Gg: ATEYQzxyptXae7DgPCvnadq6ipNnliTJCz9Ja5HfnjwyZn10oe9WVHMgE7ikbF6ScM0
	HUnpNfYb+qW4pIy9VSA2zEho73MXjOmTdihXdxpQnveM/TXh2vSt9q4aZRvhiunVsWQqg6IDWwi
	Zj9M3mAA3fbLyDNjFQh5D2M9reG3Ka8wg/NHUIrZMplCmVCZAK6qudiqOUf5lun2b55dNbpkRFl
	/aNKVZ9PCt+pk1vzNwKpQ5zyKuooIdO7mTYyDdj5ZCImYnkhUQlr5xADm4HPAoTEy7/SCKnn1Q/
	1GdfHmQ8p0VzFCuuwXOrd5kXuNhwBDi+uWh//HGLechujwLd8u0+zR1QpsSg8DpuxoKPuBLsVYx
	D8Sn3HCzxU4yP3qw3E/w6Z8ENsM3Sl+qTrOapjCUHlukV06pU/pBbBW4qH8TFzkrTm8crpm+FYY
	itlMNebVfrvL/Lk9dHQL6LsUVWsNhGJEsxitM=
X-Received: by 2002:a05:620a:4688:b0:8c9:e976:d20 with SMTP id af79cd13be357-8cd5af8033cmr487097285a.46.1772667948717;
        Wed, 04 Mar 2026 15:45:48 -0800 (PST)
X-Received: by 2002:a05:620a:4688:b0:8c9:e976:d20 with SMTP id af79cd13be357-8cd5af8033cmr487094185a.46.1772667948169;
        Wed, 04 Mar 2026 15:45:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a133201faasm14952e87.68.2026.03.04.15.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:45:47 -0800 (PST)
Date: Thu, 5 Mar 2026 01:45:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kerigan Creighton <kerigancreighton@gmail.com>
Cc: linux-wireless@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        wcn36xx@lists.infradead.org, andersson@kernel.org,
        mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: qcom_wcnss_iris: add support for WCN3610
Message-ID: <cptww2oiwbgwizp3rqi6wo222ahuldwebggzh5l3dyjajkrgdw@naknuuzr7f4b>
References: <20260304192409.927562-1-kerigancreighton@gmail.com>
 <20260304192409.927562-2-kerigancreighton@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304192409.927562-2-kerigancreighton@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5NSBTYWx0ZWRfX0MuFRRijXL5i
 ilR11xGQW79S33DQemhow/6DHDBhfqJqANIeCTB4GXeD3mv6Cjijj+XfntIipYmf+3zFOInNo5p
 ZHCdac5i9EtBMsB6bQPNxdXNL8mMPXdFiKNWVmw3hu3TNoo7yvKfqbWCBm8ZxQ+5TavDwaJch1B
 roZOVz0AWohpLE5VCfps2+eiCkQtO6iNTBnq89Y/xwtnHvf4oGmjgdBToFra7l0EwhQh5tCjbh+
 VYJXZyH6T7GXSyPgM4ONrs2aTd9ag+PRb7VVIaaaeVJBIKmqTsKwvJ7nlhE5UE2qcAc68ulT6Mm
 2Nn6abnLaxF7OkcQllQnNvyfVonjBe+6YBFJVH1dvqqyJMLnhjUl5xWnxNJHt7z1iyZEyBRWO20
 zHkiMhCwqazTtKabP6h6LUEtwfJ1ix8WmFuD+/4baQ794I89bang6cCbKmBPh4IVHCLtvuzybfr
 iqabW/9LPCITfMLLOAQ==
X-Proofpoint-ORIG-GUID: YAkGpSwE0uTdRpJ-RVcbwRjQXtYn8pav
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a8c42d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=mcKtCiK_ZK0mLSSqbOgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: YAkGpSwE0uTdRpJ-RVcbwRjQXtYn8pav
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_08,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040195

On Wed, Mar 04, 2026 at 01:24:08PM -0600, Kerigan Creighton wrote:
> Add a qcom,wcn3610 compatible string.
> The WCN3610 shares the same register configuration as the
> WCN3620, so its configuration is being reused.
> 
> Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
> ---
>  drivers/remoteproc/qcom_wcnss_iris.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
