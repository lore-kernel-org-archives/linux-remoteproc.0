Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C1F420881
	for <linux-remoteproc@vger.kernel.org>; Mon, 17 Aug 2026 13:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972717; cv=none; b=F3OVhdliJoaXwgYcpD3fezES2FQuW0BQ+N5g2EY+8fQAMC/DwWAc33IchFFn7rC/CoKaPONUX4JMX9axgczHkSmuJcM+V8tMis620r5Pgq5NjD5TbhqYyybzTetrcxVnO/ra9/g81eI/ozS4vhOz4nhDhW23YwRUABBuXzRyI4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972717; c=relaxed/simple;
	bh=qejeP/r57cvletlIzDeWAbeLmrbPTopJbzkBUcACoYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mGsIaPm4/nRp6ilBpTCgMMEhc5crhgn6TtRS7k23T598p24C6uUNcgHz01E4Ut0dCbiRteRxsIgT6NcoAoXtEmH5fmQRLvouxfnn28jl9SmgDnIma1Q58ximO/QKG0MRZgT8xyY/3d6OnVenJzWclPQYh0NpnoZvEcCw54oVNrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EguILw35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6W/tyBo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EguILw35";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6W/tyBo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5hI83454133
	for <linux-remoteproc@vger.kernel.org>; Mon, 17 Aug 2026 13:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBFGnWLgMO8eZ+0Z/52KWb51GR+gHGM9bS7GzZnkurI=; b=EguILw35rLZoqupx
	6Tc15m0hiVAGGdBqekjWQ3k1U0wjZZxCvPkmOql6Uz/jPokv85oq21t4WUBWMB6i
	c3A/mQDcNf8t1WNOJN9c36wazrkEI/BYLJZjtLAkhU0QARJQ0KNjNKsfse4ihEcc
	4S/rTcX/yo53yehyzOUA4VT9uQBFG576csJEb8ftf8QQl27lIPyq8GinNuE8vc2q
	HDverSzaRiKumEk3VGgNGzpZ3H2KgKcOXGjL69gOfck0JRWh0RHe3gYyzIU6wQ7U
	m4qMgn//AGqJvpxtf0FRmZiLKefGrJSwH+kOCT3avVjPw4N/xvjuIWCIhzWTxVkr
	zm8Obw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7krxvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 17 Aug 2026 13:18:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21be5bb4so9529621cf.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Aug 2026 06:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786972714; x=1787577514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBFGnWLgMO8eZ+0Z/52KWb51GR+gHGM9bS7GzZnkurI=;
        b=C6W/tyBoUWAFnFurNkRD25q9d+qZ7JbLf/wYJvL8RNaWyOYoPNRHuWuYHOkYt1zzFN
         +pgetfXCxUtCxXzI1xKPN3pLIRWo6dUo1AsWy7po2C+2T2cUN5ujfJpv14lIBm9USBmZ
         YGDvSF/f7AXpRn+E1snHjvoHwZU752HRPnxAx2WHWq5a51hz4JtLTV5FRAOoN0K3nDv+
         MZjvUj1vVJu4DNRlsELhxwj/cscMJkHl6KKF1wGxNN8WHa40uf6x++bW/Yda+mkuihqO
         QFxpsxzwjFMOzlx3XUJ04VsQvh0FVfs8GYabNulxWMJ8OHECsgy8ISluSNlioDqxxuuc
         ubfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972714; x=1787577514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBFGnWLgMO8eZ+0Z/52KWb51GR+gHGM9bS7GzZnkurI=;
        b=Z3yuh8vRkvbxwj1utLW7MN0ZL1gpNSzzcOC6mM+lsuO9uc3947Gg1LBwasnnWhsuRJ
         0hEzY2DamVbiVGRFlixmu4lYmeZUxutiDDLdTn2ZmUNSwY71JVSA1LIT9KGKMKiEqbMR
         mYvUdODAXaTsqmoXo3E3XFa2tI9X7JFtePQuIvUV6BIzxfBCWss5xLq03Okk1CA3ThwI
         QxNXfffqt1xHyYSTkfKPG8SS//PmTTAsZ0zK5FkYhKvTqKRfJu33SXjeNydJhDin+XrY
         E2Qsc3UI/bkmhLWYUDqmDLWUftzY/LTELGg2NDkvQfMGtqay+ujRCqz4WHTkS+Qrl+ov
         hofQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHrKblx53Z843zL0bv9hFPXJSi4mx/fYFko8ZoDHbElW7qRmZbYMUxVxR6YBYmAeBK3aTTSl4qo/01epLPLBEQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ8DEqz1g4diApjpf7GRG+IhraAqPiOUn9XTrLthEdeaDLB8xc
	NhIImO5l76VDKlp3ASXuE8fUMbgsNDTp3iY1E+g/UqBsSWjLg53GkVjxW9t+2YU/j0dOekqk7Jo
	uckQue5F42PCxv7pg5xZmff3jyV3AMZ97dMRgfO/BUK/BYSziRpvyAVPnb5NDm8WjUnZPQfz8
X-Gm-Gg: AR+sD12XZlEmpNsObTVdGuBe2okWWe+Yx68GtdCsiJp0ngm+8dCArqvBJ4BMCivamE2
	IYj6by0rJ3hbBn4LL852J65zeASy3Mr1JsMpVkbed3ouXHWv7okKfCB8CGDYPzHeEt9xaJH8n4J
	pL11xINmIYuwfFu4ktEf0aOTxVSKWyIhU+o0Hlqf7nFumko+bb0MJheivXpRxVB0EZWNnJUGkB3
	P32mnfK7aqveeoZEcB+ys5umAkburh2xJylYwTJHvG/D3saBnL59OBgpzEuPXi6PxqC7vVO/d7W
	AlIu1bBMqF5qH/6o7SgnViqpZVmUsdb/GvHzk01Qpe+QZy+nDVIGgDVzjCVhuUa0aacOL5srxOx
	H2oiej/qg0vtTu4kBrwsTxK1z
X-Received: by 2002:a05:622a:c2:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-52d852f49f4mr195411601cf.2.1786972714132;
        Mon, 17 Aug 2026 06:18:34 -0700 (PDT)
X-Received: by 2002:a05:622a:c2:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-52d852f49f4mr195410991cf.2.1786972713616;
        Mon, 17 Aug 2026 06:18:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b99f78sm27821266b.50.2026.08.17.06.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:18:32 -0700 (PDT)
Message-ID: <1699019c-510c-4658-843d-e1ecd7364c5b@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:18:30 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] remoteproc: qcom: pas: Track HPASS ADSP cluster
 membership
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
 <20260815132541.1575121-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260815132541.1575121-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ku_53VawsmiCpS_cXon2UzNke3QhjY6s
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfX3lyERRi1+74n
 s8R9cFUP0iBm0nuLdXOkC7SLhmXB+inSuzUO0b3vB9I53YREX8/pXqeciFdtAEV6kW5mDfJ4rDl
 fXOKjvyFjAymnHih1D6kdeM0yBqC3Fc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfXz7+xW9JDE4hD
 D8wU6Jj4lyRItVfenK8U7s5wk+wK46XNAmikmTJ3CZWkpRCwp8YLyysMHv+uetdVrM85zjBsnXK
 sf8jIQt10k1VV8PsgB8wQr1pCH46SktJsUEQ2cYI7Gfp65Pd+sHBrRycDX6jVvjf7nqdpQz10Wa
 jfhjC3SDejtEnUjknPheapn3739UAiiTxhNGbEg1Ixp52c7O0xBbx9RCge42JUToyIXIuw2qiWR
 7X+93n6ds5505TBCdWgluorapbemAUJPxl0iW0WuKa0+CDZDzwHG9OEAtZZYA8odlfphctcJXUW
 FUqDPGibJjwgoIM6p3foWrR5y+9PaYEstLVgsZHYaO9ZFX6x4iCseHtb1Ucp9Ok5zSxDw0jGEqo
 EClHhqD9FalniPqwiUp6UVVGJhTCvwGlM2SZ6v1K+OrfXXhVGZXMfRjtOP7CK0NU3AgcPuobiV6
 vm66yMPsA4Qab+cmSXQ==
X-Authority-Analysis: v=2.4 cv=HYEkiCE8 c=1 sm=1 tr=0 ts=6a830a2b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=8sEQECd3dATjYAwM8-8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Ku_53VawsmiCpS_cXon2UzNke3QhjY6s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170101

On 8/15/26 3:25 PM, Shawn Guo wrote:
> On Nord, ADSP0/1/2 share HPASS-domain resources (PLLs, AG_NOC, RSCp,
> CESTA, THROTTLE, QTMR) owned by ADSP0, and their firmware cannot
> tolerate one member being started or stopped independently of the
> others. Modeling that requires each PAS instance to know which other
> instances it is grouped with.

[...]

> +static struct qcom_pas_cluster *qcom_pas_cluster_get(struct device_node *node)
> +{
> +	struct qcom_pas_cluster *cluster;
> +
> +	mutex_lock(&qcom_pas_cluster_list_lock);

Use scoped mutex guards

[...]

> +static int qcom_pas_cluster_init(struct qcom_pas *pas, struct device_node *np)
> +{
> +	struct device_node *root_node;
> +	bool is_root;
> +
> +	root_node = of_parse_phandle(np, "qcom,cluster-root", 0);
> +	if (!root_node)
> +		return 0;
> +
> +	is_root = root_node == np;
> +
> +	/*
> +	 * A non-root member is useless without its root: it can never be
> +	 * booted, since its boot has to be sequenced after the root's. Reject
> +	 * it here rather than at first boot, so that a DT enabling a dependent
> +	 * DSP but not the one owning the shared resources fails loudly and
> +	 * early.
> +	 */
> +	if (!is_root && !of_device_is_available(root_node)) {

Let's use fwnode_device_is_available() instead, even though there's
megatons of OF-specific calls across the framework

Konrad
