Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0CD632
	for <linux-remoteproc@vger.kernel.org>; Sun, 30 Aug 2026 03:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788060035; cv=none; b=Wf2irVLbJUIRhPmNSd4Amj0ZLJsprlncfezYMgjevSrGCm/nRN/qDQZK/kbaBqVj38+vQnMEWVfdJxO0jDw4EvhMdgM3kDkv38M3JNswgjBwDpgXV9Gu3jjZoiuOrZFQKl3q1uLFdL1+bUzJCZYEAv2dyWfyGp61HMR+rM9AOc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788060035; c=relaxed/simple;
	bh=mUhcbyGhe9VYjTu5yf5V0RK24RSrEpI5mljwXgFiKPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkehrtGfs1jYfZJMcVg+ou93IDd9OsuAPV+gIFdfWYu39BLFCMtOmYosBdIExp27OjI6zECuwbfln+R2MTzaW3TbHfARm+0M/PQi+DcPUEvVsb2PDEP/x9QPn+SOaZMCXaerWtwiDRvuY9zAhd9AgeIhr4dzar5Pg+jwdiYdaic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqG39670; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AO+Sdd6Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqG39670";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AO+Sdd6Z"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U2S2U22401582
	for <linux-remoteproc@vger.kernel.org>; Sun, 30 Aug 2026 03:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s5ImpFoqGpB7ovqcitI6S6iN
	CeyznJR7Lkheif6E/2g=; b=YqG39670VvvwFxJnztw8YFHW4CKSacsEVaaB94is
	nXBJvtDnN3PsgKUD9doIBfVlqc/YNJCMeyGf/15MLEzJSoRQuO7UATprpDi8LrZg
	v/lRGX/usM7L+j2rgjBGjiq6XXNd3z09FvLDisDqVxteyDWoev8K3Sc0v5TH2Sy+
	Dcrpdizpgj6PVMMG17XaqY5N9Vv9iyqQ0F4HzcZhd2R5ggMiRa6hZU8i8L250/cp
	pXSrcDy5AofLUkkeq0CEibeLJaRGJMXlW7eliAA4MayLE3ENGj12j682uDimQE9P
	g+1/pDVRXsmukCwitpKPAnL+8XQw29nJSntkpScLdlOjFw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgt44q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 30 Aug 2026 03:20:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so42947745ad.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 29 Aug 2026 20:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788060033; x=1788664833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s5ImpFoqGpB7ovqcitI6S6iNCeyznJR7Lkheif6E/2g=;
        b=AO+Sdd6Z1/93Nug0PpT7fpd37sI839KBGj/W1Uxy8Fhr3xDtB0Z0Owy4TtTe8iNCDV
         20E0gBjigu9ww47HiM8yzAJUG3kivVc5e1THZHvyTOMnWeb5hVMNJCgqvQw80rRtrUs4
         Q+F1NbLDn5Q4RWNx9S/eMb304JYugy+PnpX76oRwt+ObHtPAlvVN1qVUjHEKFTBxm1WY
         gKEV392xy6hBZ/GSyS7k0TTx7fq/yN4b3GApDWZfeU1Y2Q6BDveOX26NEBTI8joF3wQg
         Xlc3W4hQOhZo37NX7+id0QC9B+eb/dlabrVUkfUNmQffxyRRDuL8moprCcevZE2zQnAv
         G3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788060033; x=1788664833;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5ImpFoqGpB7ovqcitI6S6iNCeyznJR7Lkheif6E/2g=;
        b=XwUeZQl8A9Zwk6nX4W7V1iCwxcZACK2/wbJxpHfRQm3iN7OwfzTribYIPaSXSLbiZq
         XfWEFWnzGKdaYsq5/Wdu0mMjvfnTGW/oCwcamcC/0CXiQj/chaG/eI3O0E3vXhuhVJCr
         UhOnV6RRv5IEiJhZ7I9o9GI2Ki5tUMcqX/vuM7ZCqSP5ivOAbL8ZCNh5mlzRNJmVc6oK
         QRWIOzEA9TPdVBe52jcNh4doUC2vnmP6M6k+LqS5a1TY1sgHACkUZ6I3MBB2vqmeKj+2
         UJv8kCPu1udFHOjBy8JPZNffY2rLDFuMuRB0RmGDSviRWiNXMHEJNCcAJlrC3db1ROaz
         Kq7A==
X-Forwarded-Encrypted: i=1; AHgh+Rph92ieII4P9jYWu2mGy/pqMstZFCICBW9mKdddL4L4vNSQn2JIOzzhwDoFlf7eNwA1Vw89bj4jASc0Y0ruuqrn@vger.kernel.org
X-Gm-Message-State: AFuF++kYZs4kAvFJNw0Zhyp0iGlVYiTiwa5YJUIIfghqcwEw2U963u78
	zadfNWqsmbxVWEC1yoHTpd7diZjBEVTJMZOKfW+7d5zg6sIJo4qrj6J38AzZSprWaQ+6B3hRgkt
	JieyRNx3SVNrv1OGvPpxHmcbNBrTXzGLjxxk7OH+AIqjvgvQ26WbU4myV+dUXKOVzUjF03LZb
X-Gm-Gg: AR+sD11AKYy3NdcgTJQ6Macm4Qswyqj8oMbul8IP+IJUeXoBWulPcfeR+UVLdZ6WLF8
	39qHF1r7zsnJ4xlI7q+t5WMgAEI21E5PoFdOyOvMr7oUYwDDxXZbExC21vmVDI/hsikGw3cCTJF
	HGFTyEPtMRJHlp9bdGQZgpTvA1cs+8K6XOPo7/FJ6x8I12RPT9ZqW6SmgcxcnMWI1xqQwABigWh
	UgmfxicKCC+u4y6JTVa3j1XDIYmMWf3Hb6zB16788W5pGYLJkJ1HDMpJgBI0D7AO9y5rQdUKYTW
	7K6TSdg6Nn/2710isV1rf1KHqAHBK3bhe6jEbmcI21MBe3j4Nxhvrp7MPJldAImbA50RvGbmvF4
	v6teMF0rh27k0O7KkrgvDQfDxCzNVsb+8Qpsj/jMKKr8=
X-Received: by 2002:a17:903:1b63:b0:2d9:e83:4de with SMTP id d9443c01a7336-2d90e830846mr19916085ad.7.1788060032675;
        Sat, 29 Aug 2026 20:20:32 -0700 (PDT)
X-Received: by 2002:a17:903:1b63:b0:2d9:e83:4de with SMTP id d9443c01a7336-2d90e830846mr19915465ad.7.1788060032156;
        Sat, 29 Aug 2026 20:20:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f80a0a5sm21627850eec.11.2026.08.29.20.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 20:20:31 -0700 (PDT)
Date: Sun, 30 Aug 2026 11:20:25 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: remoteproc: qcom,nord-pas: Switch CDSPs
 to NMXC rail
Message-ID: <apOhed4SxBZbAzjM@QCOM-aGQu4IUr3Y>
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-4-shengchao.guo@oss.qualcomm.com>
 <20260828-comical-cautious-inchworm-d7d255@quoll>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828-comical-cautious-inchworm-d7d255@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDAyNiBTYWx0ZWRfX5lJcje59HmaQ
 16MQod1m6OvPwiMp/cFMinr9hCQXXhzOqrJAuE7cYAZ1+9wO9+qsuCV7LuSn+l14+ltBdrayWHJ
 Vg9yBziTg8ybmJl6SbKw3pxriaE99onL2kZp65fP93QCwRkYrtTwVXpzUA0PAvXx6BUxrcGV+BW
 0NChTxGFjO2Pxd5hi+89JWvTxgg/eeE1GZCPrxmtYb8LuG62jAr+H1Sb1KMsMEQFuUE0FVhs1de
 i4autbL4d7BDVi6Hg0cWwtF+ItXMJfH8WU0mIV1zMjXoCKC6F7uBhOqF9SDQwoRw/Wx5XOlaxGc
 +rTCaALNoI6GO6ZP8EWG+o09yX0L4BpZEkaLdVgkGq6yOtXtyAnHELgQLBvcA6hQpwse1IDKyq7
 WGL0my0eGH9WfakAz8Onxpj0f0NTy26beQrgqEUamh8xMCCKOklZgVhZbLBPtvY3xng1HVo3suC
 42zQZ9Jev53yPJxXB2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDAyNiBTYWx0ZWRfX0t8W36anPpo4
 PoV4V8S/NPNK6ClZQg1+04sFRkLbHGgFaKcfAjPMMK/dGZGSMy2IOesTp0T6DDeHXkV/EcdttD0
 VWcOq23eYaiooC95FSEWGdCF/fJRlmw=
X-Proofpoint-ORIG-GUID: YnYVsQd75DYPDmB0-p41O0kaywOFGD2t
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a93a181 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WpazWQ_6EXOS4ck9U2YA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: YnYVsQd75DYPDmB0-p41O0kaywOFGD2t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300026

On Fri, Aug 28, 2026 at 12:23:42PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Aug 26, 2026 at 06:27:45PM +0800, Shawn Guo wrote:
> >    power-domain-names:
> >      minItems: 2
> > -    items:
> > -      - const: cx
> > -      - const: mx
> > -      - const: nsp
> > +    maxItems: 3
> >  
> >    reg:
> >      maxItems: 1
> > @@ -104,15 +98,25 @@ allOf:
> >      then:
> >        properties:
> >          power-domains:
> > -          maxItems: 2
> > +          items:
> > +            - description: CX power domain
> > +            - description: MX power domain
> >          power-domain-names:
> > -          maxItems: 2
> > +          items:
> > +            - const: cx
> > +            - const: mx
> >      else:
> >        properties:
> >          power-domains:
> > -          minItems: 3
> > +          items:
> > +            - description: CX power domain
> > +            - description: NMXC power domain
> > +            - description: NSP power domain
> >          power-domain-names:
> > -          minItems: 3
> > +          items:
> > +            - const: cx
> > +            - const: nmxc
> 
> That's the same domain from this device point of view, no? The names are
> not representing provider but consumer.

Yes, you are right! The v2[1] was sent to drop the remoteproc changes.

Shawn

[1] https://lore.kernel.org/all/20260826135454.658615-1-shengchao.guo@oss.qualcomm.com/
