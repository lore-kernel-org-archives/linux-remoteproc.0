Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6213EE1F1
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781790808; cv=none; b=O1PPdoJa3yHAE3LU5SQi12kGH8/UAuOAfF+DOZiawvEEygbbIDEDARszSvVWOLxd5qmvFLcjKLwpnNwG/MCz4YtVf2wWPP7HraGim967d2aiirz63ZrF9NgjlavoJA6/0IDN+/YjgIyWloOi+YAOWZidx9xxJZzOMKD92e/p+m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781790808; c=relaxed/simple;
	bh=YexXBNpmnYxQOYftmqOU5AbU0jmyopm9YUYHVCseLMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fesj8YsX/UJStZb1wOlRImbGiY8DpJSX1mHNiwS3q+A4p1fGZ4zaZgLwshtrNe0EYkGfeDDZ17r9WPMfOhebev6yAj7a5iw/T31ho1kxrp0H+vI8CS5wk+4VRVw7A1D8K78h6+aRR/soU1n9WH2XeS4Tin/22Y06peeRA+KBJyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fr4yZnyp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jDWl5XAB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fr4yZnyp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jDWl5XAB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IDrQks1331439
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 13:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uas64FM+4sh9SshRHLFz3Gu9ZCdvqAdlS160bV7fnpc=; b=Fr4yZnyprS95rQZi
	3xt3uWeSHavkO9BfcZ3YPjtFNtBAMLOo6PaRWB9k/eIJgpUJLnkWANEASTI59VbQ
	2+wAEe0cIaoxHzI/UKHiUvPJKmep98/X/cgMvMYZbkTRepYe5+GfObEY7YIeAJwz
	2MDJ7dm+Issw6B+l/C5h8MG+qDW9I3ddeNkLmX5p5c30dgEpQXnOkzB0kuxRAg/A
	kRV62wTST1lOLsfzOJhlPt3OPaVLxFWkRoB5RvYDwefDQdyVY//suXQpAMM148lx
	NVrJjQg7qrk6Wpy+hcSz5lMLNMgx/7QVtyvTJpSz/h9xsXRO79ySeuAtKjk5iLBW
	FtbNMA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euxt54fgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 13:53:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178a632a12so2548121cf.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781790805; x=1782395605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uas64FM+4sh9SshRHLFz3Gu9ZCdvqAdlS160bV7fnpc=;
        b=jDWl5XABiuC5LUbETelDS0WT8urrIrQwzZaI6WelGeRknd0fVjCqd4fTMCuMIrMsT9
         9kgKKEg6KyAYIBT73Z02eWDHoQe4SfO91GxVVdB6KTAu/Y+yQ4f455QOIKUMrNICUsZI
         ek0dlwlxrF7VUf+xw+90tONofkMbix3y6VkIh3rmXUWejO9redR2PvFdls8YtPqAker1
         UDBPKNXRB0q6AJ7E7cZtjnGmglAZH/PzeGxaq2t+3ZwecVdVXAmRfC7QvO8H/aeLK7YJ
         9ef/vCdz4BeedKWePtMW1wSDj2kDnw/8WRemtBChtbEgqFWiYPw/4y8IHx54VkQUb59c
         2Pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781790805; x=1782395605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uas64FM+4sh9SshRHLFz3Gu9ZCdvqAdlS160bV7fnpc=;
        b=quEconP4g8hyyrDjJMuNgUpMkmAxasI2qtz/9EozGWjZunLVSqA/SpJbw94ADxTi0Y
         LeuXukS8/jOE0DFfsxiURe1BSt/RBUq/2jzIDDcxsI5o0kMfDFhnqRuw2WSqz3W35+NV
         hxSN1FQwwoTGfwl95X2kFiSs9xZNNfWPUroPaUHxGsp/wEAmlHZhkjSqjtxUZOD9xz1w
         FZW1Wx//blyv8XgruMSydgNpk40zJUis57zx3jXApbmbZkroeMTsm6iFAcLWJ99HTY7i
         X3fQGselM5GBiRsSBqVa4weVRzsBemA3+L2pTlp635+tk9NwiZhwGqLrPEFGcpNnWJ++
         cuMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8tyxcG9exbGXOFCVZqF+WmfaX6oiYTqlNHGjUeLHOkDhXXvigo8ANhQPEe/thNsxAVa75gq5QasrkZy+psfRk9@vger.kernel.org
X-Gm-Message-State: AOJu0YwfBJ1Rte/HePOMBAvMF6mGRg+AosjT59CZ/IFukrSsmgMk4375
	TmfW/bTg5nvVW5IerbJsAS8NxUVgLZiVm3TN1NPyEeQdNieM5rKwo6IlujXEw4x51vUb8j8CQpX
	eGfFVj2QIkogmpXTvCkeonr3wEtf/JjApKCDFqyLXdocSk5KBmCS2ZAsmUMTHQZcOsFXxkfp1
X-Gm-Gg: AfdE7ckdvoBMBHkJem7NyFybjaipBa1dJQENOle0bE2lDBb7PerBFbUC8hHA5yOmnqZ
	DtN7UdM9AD5YQ/il/Dirwumu40IaGruiCSuOdnN5oIeVaSm/VFNxVNQK3Fy3vTfLetU2X2hNs0I
	fnCbrZ85Udb4+JXktmoM8leWad/ql1BhA9CVcCynx3AI0AXnk8E2fh50OrsMKWhlPQbZzoxNqYq
	jxdTcFYkWC/0kr0whOBYbLzV3p4EGqRdFlxeO7ycHAtgl7TOQIQN9wnaGvmUb34Q592JcsgC0Uy
	94ygkfV9Yqwh1Qub0NHbsRKzXJjG1Qmxmy1wydbA5DFCygGiPmHeLsWp27WZd2IqUYKDjJg/3qz
	Y2JNgSODb+VsnTJscPr1OR57K3+UXIj9TiGM=
X-Received: by 2002:a05:620a:3909:b0:915:54b2:582d with SMTP id af79cd13be357-91dbd00a095mr848681285a.8.1781790805510;
        Thu, 18 Jun 2026 06:53:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3909:b0:915:54b2:582d with SMTP id af79cd13be357-91dbd00a095mr848678585a.8.1781790805107;
        Thu, 18 Jun 2026 06:53:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6960f9cb62csm294872a12.21.2026.06.18.06.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 06:53:24 -0700 (PDT)
Message-ID: <62c91b74-ca1b-44be-8771-669aa686ddbe@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:53:22 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] remoteproc: qcom: fix sparse warnings for __iomem
 annotated mem_region
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430191253.4052025-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nrAUTZHR38JMVLE4MWcU13xtCMgcbr-k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyOSBTYWx0ZWRfX8gz0FA/1kyvM
 VuX/u34Bua3VZrUOr2WiQW4dywbgrfFEgP/rrYDFcXKoIdC2J5A/6vsc5Hk9CJeDXOTGGjPW27s
 +uvd/27c6GDxcbo2Lj3MxxNDLMt1H7I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyOSBTYWx0ZWRfX7fNtSFeG514N
 gr5oKcTZ3btKfsvIZqoL3IxmnWPNXzuFuM4wuB1imDAOTgOwjkg0LxL4szjyhTQaoNqn2Dqk+S1
 usnFP2lw2W+iX69IRaY/08NWIDk8uSgodHh3vvYPqJjXNu91IOGd3JkgRUpX5HB0GBGA4rdFjIO
 cRqn3apUtKt9BJOLb6oHY3ihCOunJ+6XhrjcHlFohmCeSb8+qX/YrJIgX6Yk3fMgUGaTbMqpslN
 7nNzbSMUakiBTQFFvJPU7eocob/CdGZ32o0NJe4+hzMIFOxBxT5LxGW1XyVkpFch5B2oF5Ae8gE
 /1lw8/RPHXs37ktPwwhHfV9dvmbvubJtWcTCCx+g9vrE0EsDoOEP7DPQUGog8I9OP4B6kJg3yVW
 ufJf3uIbz6BzDhgwXC2oaLxMwWKg+DEI7tEWJB/I1W2cl4ynBU0Nw34/G49n2MZwwT4TYfWBEqX
 NhQWm1JBvzgdpqYNeMQ==
X-Authority-Analysis: v=2.4 cv=PMw/P/qC c=1 sm=1 tr=0 ts=6a33f856 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=jR6w9rUPJl4JbJ96X0MA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: nrAUTZHR38JMVLE4MWcU13xtCMgcbr-k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180129

On 4/30/26 9:12 PM, Mukesh Ojha wrote:
> The firmware memory regions in qcom_adsp, qcom_pas and qcom_wcnss are
> mapped using devm_ioremap_wc() / devm_ioremap_resource_wc(), which
> return void __iomem *. However, the mem_region (and dtb_mem_region)
> fields in the respective driver structs were declared as plain void *,
> causing sparse to flag address space mismatches:
> 
> qcom_q6v5_adsp.c:639:26: warning: incorrect type in assignment (different address spaces)
> qcom_q6v5_adsp.c:639:26:    expected void *mem_region
> qcom_q6v5_adsp.c:639:26:    got void [noderef] __iomem *
> qcom_q6v5_pas.c:141:45: warning: incorrect type in argument 2 (different address spaces)
> qcom_q6v5_pas.c:141:45:    expected void const volatile [noderef] __iomem *src
> qcom_q6v5_pas.c:141:45:    got void *
> qcom_q6v5_pas.c:637:25: warning: incorrect type in assignment (different address spaces)
> qcom_q6v5_pas.c:637:25:    expected void *mem_region
> qcom_q6v5_pas.c:637:25:    got void [noderef] __iomem *
> qcom_q6v5_pas.c:654:29: warning: incorrect type in assignment (different address spaces)
> qcom_q6v5_pas.c:654:29:    expected void *dtb_mem_region
> qcom_q6v5_pas.c:654:29:    got void [noderef] __iomem *
> qcom_wcnss.c:540:27: warning: incorrect type in assignment (different address spaces)
> qcom_wcnss.c:540:27:    expected void *mem_region
> qcom_wcnss.c:540:27:    got void [noderef] __iomem *
> 
> Fix this by annotating the struct fields with __iomem to correctly
> reflect the address space of the underlying mapping.
> 
> These regions are subsequently passed to qcom_mdt_load(),
> qcom_mdt_load_no_init() and qcom_mdt_pas_load(), all of which take
> void * and use plain memcpy()/memset() internally to write firmware
> segments into the region. This is intentional and safe: the mappings
> are write-combining (WC), which on arm64 permits bulk CPU stores
> without requiring the memcpy_toio()/memset_io() accessors. Changing
> the MDT loader API to accept void __iomem * would be a more invasive
> change and would affect callers.

Zooming out a bit more, should we even be ioremapping these regions
in the first place? Are they not just RAM/Normal Memory in arm parlance?

Would switching to devm_memremap(, MEMREMAP_WC) (like we do in RMTFS
today) be an even better solution here?

Konrad
