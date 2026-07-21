Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD09370AD0
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641314; cv=none; b=AdiSNsvEA2Jg4zHZstbkYLZHu/BAdzPg+zRGUN9tl50pPl6MMUW3m+lCs181mswauFBaYKPSTw/WuQyBuRdxRUwRL+grvL/jVsokzhJ9jXAHLY6fwXMUDyc9MQefJK8gw9DZ91gLeVDpiAjzwufedqvllwPZbqghC3jTPYrzxTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641314; c=relaxed/simple;
	bh=ds41uiC7oRBQ5NVCa4hz2bePlchziR7UFKhgrYUIkw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXa1P+pVAWDK08sUNGL1f+IFT/YZ7rkywN54n4Bt3knUZoozkxe1hr7GAhGq/mfweFQWa/EbYTxcPm2F+ibcpiWiJQXy4HQTC2xa9roZOmZD4rlxj1M9FiqCzGwnlJYIBXsJs87eFosMQ4iA7CGl/1prvknlWQB6nY8Viwih1Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FPBpUMMn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqgJLFij; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FPBpUMMn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqgJLFij"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfp4N2071461
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 13:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jn+bU5PH+vGIOjjifUsUR+qv
	nZnsXNeOzfoYsc6YQUU=; b=FPBpUMMnEp8FmAWETiiMDKk+OxLIHO7oV30zY/V5
	imM+Wg4L7XZgKh5ojwWUJ+l+MS17Iw2La+IPiKKlBOibOuUBZ+tTxByWw0ZFtjPT
	Qrx4yh5hIM/JiG154Y9NRJYtbWzVgqo4BSlydjjSUjOr+dk/qwY0awUewMxtyya7
	a7HTgPdikjfIJ+Mwye/PzkwRQKC0z/U15anMpjjvbFkCMr8eSUGIsjkSrfe8NEyo
	waUb2HmjhUR+Hua8Gcyu+l+i3YbBFSXZW57X2omfCYMEIVg0ll9LQWN4OE+f7RRx
	X+ANxB2QjAOnDN9UUn2rsUUHBlM9uG03e+YOcBsIt5IWoQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3gypd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 13:41:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso89554661cf.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 06:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784641311; x=1785246111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jn+bU5PH+vGIOjjifUsUR+qvnZnsXNeOzfoYsc6YQUU=;
        b=YqgJLFijU6ATHAFXnXuI6gIsvHFpHg+5RIUhT178WPmumN7FYq9DfI5nCcZx73nQcM
         cZzX11gga39EOQVS4H2yTWFNXhFJ62sBqZfQ8tJc3g/atLbLQ2sEBJGQB/4gKUPFftl3
         eorzUH5W2fkOohz9DBgbr2iGHZA/HqS54BEF1s0RoqgSsl3sAXra3WwIR6PWsY6QBJVg
         gUHyrELpT3HkJ2sPx0YzzQA+m0SKqPJlMd0gAdtqShaTp2AENqwp9TwCMfMbDtegowjt
         WNdclhUNlhioXmPJVVtV1J1lG0xo0xx6xtpUZe26kVyGBLGYjf9L9daGiQ5623iWfFto
         DqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784641311; x=1785246111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jn+bU5PH+vGIOjjifUsUR+qvnZnsXNeOzfoYsc6YQUU=;
        b=VYnW+o87MvLhn50UK7o9Yc/89tabuuC4HgF+7+DLEvB3mP5pMCHgqT2fXuthJ7vJHF
         chY4frTVnywXaCiOXQkNzOjRx+V7axhkV1QAK/0D+raVAijOSN8teMcz7s24K3VrImYf
         n8/dfE8A70jloGRUkjVpQdr2Aa6qxSmHlimlGS/Bb8pUagI7B58vpwiFo+wOjHkijZCQ
         qZfn4GESvjFujzZKG8QnBUhAxo/J7j01WRAl0tPPG8CUO5+vBJxCQmJx5mTQ63RIqOrB
         neQSLMl8pS5v58YYyBH7Oh/LR9PAyQuAP0cmsQniFTMhvIfj7r2LQB/nWp3Vg727QKUZ
         tsuw==
X-Forwarded-Encrypted: i=1; AHgh+RqzlANoDEsvCwEnYyO2NO4oWXPUoXO8I0lS++Y3KBn4YsGMtSEqRx/8JGK7lu/joL2l931XQ+azR043jzIwh4q3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh1L5bwa783i5d+9EA7XShfZdCCIsYvT9sqxmcYuBfasnor1mb
	Vllqq6rkJLzQCYtyhksvvZWsiuEHS5h60XTYFI/9zpKhZOYmKZf/TwP5myJWv10jqGmWRQiu5iq
	rPFzWyI51ils2FgzsDS9UHRyhArxGygiiTZAHSF37zRwO0rzkRwA3Aj6PhmdW/Gxwo5MbIZZ1
X-Gm-Gg: AfdE7ckLvEXAadFM0EUxZbVotsA1r6VZle0RNd9POX4vAoiYsVM3hfCxBIZ/v17wMp7
	vtk+bCNV2wM7KvM194fZIsAhl9QwVkYwThyn23d+snt8gACda5ek2Qw2AjgrNiguPUri4jhKQxO
	MvCw9R5VEqJ2dYbI59JwNHBH2JR8E8WAN8Vwen9Iv8T2rhLc/dBGdVqoAGyp5AWf5VdquPe7v9A
	gLDCA/6E+FEpJAixO6m0I4MaNIOsUuN37NXoEt9IJLHK5FYkcrKpAHsXgYOdK8wQRM5Di0+JZ7m
	Je+Tta/JNWFKFCEPKbfqQur1ZnBNiTOhvrrwrIg7yQH6DgWkUWXDQ5SYNgHJTScHNmtFPuEmCgM
	jCUOae0rMTrpKxskit2vbmhbpCzdlaRn8xbzOyREz1FtJTOg5kejs5Cs0GLaAfI9FO9yMkeMUUz
	xdeBc6OWo2tIL4uw==
X-Received: by 2002:a05:622a:480f:b0:51c:439c:babd with SMTP id d75a77b69052e-5213c10a2efmr201273561cf.9.1784641311427;
        Tue, 21 Jul 2026 06:41:51 -0700 (PDT)
X-Received: by 2002:a05:622a:480f:b0:51c:439c:babd with SMTP id d75a77b69052e-5213c10a2efmr201273001cf.9.1784641310855;
        Tue, 21 Jul 2026 06:41:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a5a3475fsm413974e87.58.2026.07.21.06.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:41:49 -0700 (PDT)
Date: Tue, 21 Jul 2026 16:41:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add fallback compatible for
 ADSP remoteproc
Message-ID: <oxiv4b72vh53bmibs5jol5klkpx7zokn4r2l5o4az775nm52lx@pcz4s2w2wxqb>
References: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com>
 <20260721-dts-qcom-eliza-fix-adsp-binding-v1-2-3a0b03af2ec7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-2-3a0b03af2ec7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NSBTYWx0ZWRfX76mMTpnNynmd
 +jZAqgRVkDWQyO6FAUPy9r8MXOJmm7k8E9KlnHRv/Y5DEnIAplhmEXNPsmiVi2BFrR4uHOQk7gM
 QZ5+M802pqgihY4OMYL2yH1x40t8znr82cV+W5Tqf5bklJzl7NSe4SfZm0LB9Z5GqxjWG5B66o+
 I+4YC5E0uNbNUQspSpRst4YlBiWa//pGv6vNYwm/3E5NepP3sSYczZyQH89jiphNoaW5DbnNx+q
 MGwCT9XWMlioGLbX24Kvfb8yJ/ROe2zIMRVLSsH7lFGCJDcyEmR96a5W/GICYLt1H4B2QLAEkzp
 tsHTZkXHuBwFPh+N6GaJTIVDp8/VQZT3L+07dWYPwXZQ36BTftZZw4X7zS+1KNKswY6iyuBSWQu
 6uVx6MhjM63aNI7wavkjVLKXKT3n4TV4RxXTtOFSyO0Tzez0DuUOfnlt2ogfkbrNn59G4DP70rs
 KHw9CSgFrKX/5C/kXXQ==
X-Proofpoint-ORIG-GUID: -UFdN0WvvPt11HxOK7z0la-f92-VeQ6x
X-Proofpoint-GUID: -UFdN0WvvPt11HxOK7z0la-f92-VeQ6x
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NSBTYWx0ZWRfX1vCXYUG/zXo+
 9PuUcSB5ahC4BjXUe84bNLECUCzicWNZNNi4KrPmtmz4/b0rYjy9EwZH19NysXMZaD/xekjlIhK
 yV9QcCVPz3V/gdu2I2tXvuD+cXnnGBk=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5f7720 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=pKSKXMcIEd6FydBdNeAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210145

On Tue, Jul 21, 2026 at 02:35:08PM +0300, Abel Vesa wrote:
> The ADSP found on Eliza SoC is actually fully compatible with the ones
> from SM8750 class. So add the SM8550 compatible as fallback, just like
> the rest from the SM8750 class SoCs.
> 
> Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
