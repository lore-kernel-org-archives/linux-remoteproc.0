Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445902;
	b=v/p25JtXi4dxzrysgVTDFSdTFXvImDKBuWf/ZvCRl6h3wirc2IAakZIPY0MRBEdBCIU0
	 Xtjqcp9dY/7QgHJgEhpuIS+ZHDodDBaDsQf0CHeb8vA+DG7/QJDvF+CtH9Z2jLt9rP3hl
	 x8jtJCHM4tXA4mp75UPR2XLwy6sDUE3aBSwI+ABpKDpQx/geT7F2tyhMCzVuxFuF3tTLe
	 9kDimvy6AMx4LCch9qI81yFiMrNQfA2FoEpD10YwIJNzktp3ewAryxSea+4iMsGvECWqx
	 5Y225HkT9LlNVpMvoikmksrtB3NH4D9Lnp1JJPJp0+M7G+Gdxh1z/AwMFG4l07NUO0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445902;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LIfePWjFQJh8/rC+L/ZgDno64sd5DgcUdBm59T9ASBU=;
	b=DSTloA893SQ2tzXhC+g1u25hgl6MT4tNkmUO8NN2h1nNMbzSlVoLzI1IWCVy/Ue500oh
	 FzDzarJap4NS24VRaloNa/MQxHK0NrScVWDtE+qQpgRv8Xv09oEVW+y6bUMieLhIk4cS0
	 OtdOW4xCQV7QaPWj2AVnH7UP7wGIPhXrHIcUPyDENOML0PqfBOJgEWokvVpJk/rgRhTMX
	 EBmw2Nyndce+tnPecR7NiKKmExLseuisyN1VqSmMRoZEYSdhzZG1L6ilAtGpKbrnrLKox
	 XLf8llqykfyuF8/8aKoqyAuTfhU0YKU3PAtaO7pJKcBl0lbuJQ+4WLlZp+Y/GhKYYbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o62xQRKE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMY9gFz6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8435606A322
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2026 21:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8435606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o62xQRKE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMY9gFz6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLZZX8200438
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2026 21:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LIfePWjFQJh8/rC+L/ZgDno6
	4sd5DgcUdBm59T9ASBU=; b=o62xQRKEwBqTayFhXRc18GP26keaM0344wrBcb+6
	ddzEapubovvQW+XWoS0WwJj0Qiwzwp+gq+AjOG+Ulnjg8KHStHPTHdP5mhGqrhpO
	frJMuNazXWvNSDszNJ5ytyaiZ9gxkzdKetzn/HL3RUMu/rY0rkDjWkukRy41mxPQ
	Qj6ESj0r0mHLDgkkdchLLsU64qeVnRO4WuHinxrGrhmH96fPo8v0HhIMbMlrwoic
	A1faZqSnjp5uLhPyfKVuL7DRx+j3Varn8a3ixfxAFiO9z8oVQ6aWXkSr1HmJpUQ7
	FJTKVfKJYgn4RgjwlHwFvviTTGzOT+zKy/IP4wHEfWd3SA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr780qeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2026 21:38:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so748459685a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2026 14:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792445895; x=1793050695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LIfePWjFQJh8/rC+L/ZgDno64sd5DgcUdBm59T9ASBU=;
        b=jMY9gFz6oVSBVWCJxAWnJYu2u1iT7MQQsB4R+kvfEg7yhGUc9v3BRRpvafR3MAEAop
         VK13ahZtPJWaKy4D5WrHNJB3RS69rYO8dlGqj0XpUtIGVeIxBAh/zTfCpTWUpHPAnYxC
         qWxPd7zvUsl3UP0rhG58z6Ht3wSaW0Nvl8RywZEzW/cH8SrCWZAxb6mi/kmy/D7v3CKr
         f4czSyDAjxWwDsIaqVt1Y0/457gHa/6VJ3FpiyqfWEplzGB6zddTePshBKyCv5RgccLH
         f4e4OZOF2G3pZmyajmG/AjYzfnAwqn7magnEN7WknayaWE5XjbdlUU7mK1B5Ff2N1kUd
         pFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445895; x=1793050695;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIfePWjFQJh8/rC+L/ZgDno64sd5DgcUdBm59T9ASBU=;
        b=HbVK09YC4MQsmhDEx3BPzxkevpgX+wKfIX2H1qmZUCW+kUnRYpNCskNJwmUCA2QZss
         TnxKpnjWvC+wE+0J0M7eOcoc5Lt/a2NOqbHAXlTpoW+OR9H3ZdyTY+Z240poFZi7OHMN
         h1PujK6276mP6bcLLtlQ6Ze7uTyDaoXVzxqYSaotLFls5WaU5y13fVo5H0Q9UgiTS2Bh
         xWAOGpb/Dz3kULuTXVxRV5IYX+0Zg50xZuQrG2DVcmEKjaQaufrRubbezbdh5g1HCjd6
         a8FKK/+ZiENxCMoyRg86t6v1a4twRF0mo2zqRslah3qn/BSDfsTubTzBDKWkMFhkbTHw
         Tlvg==
X-Forwarded-Encrypted: i=1; AKwUvBybxdnuTatXaFeTb9lF/7LpqsM4++/ZhacgWyde7oVG5a7klQz91Up4GH4+mCOY3VvCI//isPjlB+mSRRLZXkXh@vger.kernel.org
X-Gm-Message-State: AFq9FYIVgOaGjvxLc+YZ6p49Mqpase5oGgQGR3Ad/gYn+3weyA8BsKUc
	31ma9/dVrVaHTgBId9eQM7QsgLM1zc69XRnrwY2jwyYHXtAf5QyUOESGgFcluMyMSbs/jmi/Vuk
	DavxVzy3sve/ouaefRkZfdALc/PwzxediMWtzApZ4BWytjGhuDcPqSXBp/rwpG9baY8KobDxV
X-Gm-Gg: AYBFou0GCNsjet03Fm1eSjS8JK+LaUQc+rFqmjmZX7BVHMKcx+TB+E55buctU+/c6y/
	4LDz9F8xL1eQHGMBDezCsWnoPWQkUmiDE54tftS85xA/74EM9oclVdzUi5xCQGG7sk8TcmS3kp+
	SM/FvSd49rGUVBq9bzOk+LmDmvBLrbewbVr6a6PFsks6Upgy6HcBxIXVsho5cJ/q5+GPOGmG4ig
	2sICCtFk2ef54gGCTvgec43/AYkBRotYz7DeGs23nwOgc+CZOl1RTP9gSr79/12/Z98I5/9eatz
	jaoamJEBsVou/UcDPRoG8xKYhBCHzeroVUbXkibOlobseiJ94efPg60ckjXxM0N6+X6QUvszoTQ
	QoHSM4KMVOAGqT3hVD5xwNUJeEHxmOH9Y7XAUDDzojSMQYKcMaRt2eZCDaXiVg6bOSdf99D5+7U
	tPq5ZgDqIbvROt
X-Received: by 2002:a05:620a:27d5:b0:93e:c6fc:7f50 with SMTP id af79cd13be357-93f29ba04bdmr1478803785a.5.1792445895069;
        Mon, 19 Oct 2026 14:38:15 -0700 (PDT)
X-Received: by 2002:a05:620a:27d5:b0:93e:c6fc:7f50 with SMTP id af79cd13be357-93f29ba04bdmr1478800485a.5.1792445894600;
        Mon, 19 Oct 2026 14:38:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a533900sm2290916e87.50.2026.10.19.14.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:38:12 -0700 (PDT)
Date: Tue, 20 Oct 2026 00:38:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 08/11] arm64: dts: qcom: sdm670-google: enable adsp
Message-ID: <5bs72nbd44ppib66n2amljtayro2ghnpek2xvdbioz5k265nbk@if7gqck2u6fa>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-9-mailingradian@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003175659.23536-9-mailingradian@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4NiBTYWx0ZWRfXx/eC2QvICekc
 TZ3v0LfGZxCk1IzFvBkb0ts9VCM1c5pzQ9XsJ73uOzmurbBvo4s8fbDoHvXrjKg3QivVLUQuzrV
 4e+6T3ZDmqSOGDuQAZL8Df3rClVHn/Hkag919xpXVmE1mN8Jfw/IDFdV7qtjOdmYF2lxOhyUpIm
 YS+oOnDk3XNtWXVgC/4IBvki8aBJHNHxsJeKuBs237stKnAf7S7aNYQsRZ8uFNPjZ+fKdYpwvAR
 3/2CH8oPyXmdRHlg3C5OJ1tU0nG8XRuDikaxfXXeJwyOlnuIuC4GgqIw0bWe0Ea9Vx79YyzlHHR
 d5s6GHF+mVp/9qgEiWCC04cm/s0UiuYZw3f9kKmOBx78/qgYVyk+EtnfO00qaArFPGm0OFKQrUP
 9QwbQSO9kn00/w0SUHY7ltWD6FJj4k6eLu6mkyp8u37oJ+2ONuaD01DVXF+uBSJEtJ0/M/YJjuf
 IYfXk6TQabSEmhlyFvg==
X-Proofpoint-GUID: uonVpcU1e4haV3vdxS-ZB4MmUJarvi_D
X-Authority-Analysis: v=2.4 cv=LKnz05W9 c=1 sm=1 tr=0 ts=6ad68dc7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=1DDleCVHwAjOA7h17fsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4NiBTYWx0ZWRfXwkiLQ++hwN5k
 TWJtJvehngPDU6HbRosfL8WnLj1XQRygFDcrcdckeLWiy27ywDj2Z5610HhgpCG6Cq25mAkZYvh
 5fzepFpt32V3mbJazLSRzrrKuq2CmtE=
X-Proofpoint-ORIG-GUID: uonVpcU1e4haV3vdxS-ZB4MmUJarvi_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190086

On Sat, Oct 03, 2026 at 01:56:56PM -0400, Richard Acayan wrote:
> Enable the ADSP on the Pixel 3a in anticipation of audio support.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
