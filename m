Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F4A3FB077
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231172; cv=none; b=Kco/xQuwfdJyoN9XeC4GA9S6mA0+w3i1cm0AbjKInNWOdzmaAaGsqiCgHGXA6oVlI+xR03eDrlHdu/ptLN/NA92H4HoAwDqepdgctKw4pKKgLZmxb2B/Q2e4AxtmiMSfZNIjetqcryEzTlq52I94A0yuqPy8qEppjnO2nYcAMAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231172; c=relaxed/simple;
	bh=rBxi0jOZcQJhPl1DG2Oby2J+QY6GfRXtXkrMqD2D/6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cO0Pv8obFfJuUpGFzHQxKk7PtDcT70bK9ng+DvIAg/zStkuwHn1XcHB8HpaWrs38yyGZiefws9Ujoso7K6sy12v0HRpzZslthoh7b0eiP9Bm1/XcwJirpygP6aALQ4sHNRcLkorsLnBaE7nzAknOxqfDOXplKWQHj00zEVoMC8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSh1RSWg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJAs7AUD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSh1RSWg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJAs7AUD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82JpU2144953
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 09:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xt8W0Dz4iDVn/lAenonY/3tV
	gAl698/PBkXcOP4l1Kc=; b=HSh1RSWgGlnzGsf5unhtI4nfGkBOK9GzB+9sGlIw
	5oBJue+7+E9YhV0T+hBooEUT0YektMLRIEa6sGnI3rJYUQnaA9vMx6CIaPVJZOS2
	WhjccYpngFVyi75uTZFaLgxh9O0Kglq97X7N+EXkh5SKueosyJeIhEifvvPHbejj
	sIqylqfWSjew1+6Qwkf+pizS538AsJIiUKYzDlfHnUaxNSTTPRpNzDk+cyHAJ2h+
	Z7+8IvxBxDlYf6HM2cJQDwk2jziTQZYAJNg4wZo7NK0rrHXJMJBVjBO9OY3SNiu5
	ZLNhz4K0pBQHFIZWe6nvfyZXKYQ9JbGzJ4sl5/KLVrwOcA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19h8hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 09:32:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so904102a91.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 02:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785231169; x=1785835969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xt8W0Dz4iDVn/lAenonY/3tVgAl698/PBkXcOP4l1Kc=;
        b=TJAs7AUD1Ln3sqa5LrHY4uTUD/vEMM+6MyhGlTb2t9VQ/JYlP5kuswtzD4Q0FdF21x
         UYpgC4EjEMnqn/GhnXwMAbfxFClOyt0QwmbC0bwSPdV7jDltxh0AFK7HuuJULHBj55CM
         e2gGLABQ3oDhWEKPmbE/+BkY4Hl4x5nj7pC6wg/i1kAtzx6l6TzcYtz24jRGCFPkTGAT
         IdMwxRThq/Qw6hQ0zAl1EQU0khbU6o9C/yESRjhsVPw5cW0dKdwsVuyOeVdhrHk2qadp
         qJO/tpCwfUhKKf9MCFpoefOqXeT0eDbR0o+SYt+M7AtyYaJVIBF4om3L7cdgZc88y0fD
         BZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231169; x=1785835969;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xt8W0Dz4iDVn/lAenonY/3tVgAl698/PBkXcOP4l1Kc=;
        b=sG/9eQ1IIbUw5ArGO/jKXSGXyE9g66ARcKuzDxvIaidS60b7H4q0p5TFe6d1O0IIUN
         XkD0Dwmc8gFbT89JxQCArF33+mHNLCSDJ1qbnP5lEJ1+dFZ0MqxRhVDN+SGtudER90lW
         vz+iGqa/wKryrvA18NYh5voXKDlmxHmNyXSs7VhwNPDJEadgt1J4Obqe1+jyJgq9/2Oz
         H7tKqP31ss+i2VVm4NaH+hjZ77n/CXBVm/7L3BROIZZJxpaofsq1dhi+hymDHRMeSowV
         5wm2Jtuhorx1bDuKny4kcrOagnNVpNnjUTJRQ8vS6Nfdsk9Jc+OsuNdbd2FBmE47Wv+8
         4YrA==
X-Forwarded-Encrypted: i=1; AHgh+RoBEdQWcqvSpMQpvBXxTQDEArc/vrj7L0CFreL/oVe+Y8sh/zqAzBCAGGz/fleqS6cur9kjCEn2MWIjCjiE5l+u@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa/lk2czKd2Dkrrx0IgRRiRuYuatX4OYV6Iq+bI24PqGQzottf
	CkNXPiumuNTqAA5gUphMzgr5ojyuTjFbkYevAd/Rr4vGxU1Ivwo9LIZf/PsUc379r/ONPdLG44U
	iK6AszLNTMA1djO9oW4PEtgYztKuHjNX+HLr43EAxNV43iiMG5VbTtCHtSD6bVJyY6kLWP6wEMM
	ny8ebE
X-Gm-Gg: AR+sD114X4EppsSD2YhDCcQqdXeMV7np2wYzVxw8aCwt3c+vnn0R64lGpFJSPr1cM56
	vv0wJhDVNeOQKxWdGyIZVDvnLiZul4BmIVk2iw8D7qKheW9tzUm87456ntHqqOJKz+TngLDT89m
	qsVIovDjQJOgwuh+GhFX3aKbOWmGIjVl7HEOo36cMVQjAy0DS1PeyP7t+ZY0HIrjMo4sObCCiPf
	OQl10zhTeVyaTQNkKwxXJ3no5K2Ir7FQZmQ6vKcGbD3tozNqlLV+DSMWJifMxCqAUjqBMEQ23EN
	dARatkEfsg/M7dod1KyYV74YrPqVHHM9TOb5FS/AMb+gD5kIW3JJuRGET3U907ySC3u6rvxH8Tv
	/liPJXZlLqn0j/l29WauMBCKfx3o=
X-Received: by 2002:a17:90b:2e0c:b0:38e:4482:ab15 with SMTP id 98e67ed59e1d1-38f6a51baa2mr1808775a91.22.1785231169009;
        Tue, 28 Jul 2026 02:32:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0c:b0:38e:4482:ab15 with SMTP id 98e67ed59e1d1-38f6a51baa2mr1808728a91.22.1785231168426;
        Tue, 28 Jul 2026 02:32:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm38522512eec.28.2026.07.28.02.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:32:48 -0700 (PDT)
Date: Tue, 28 Jul 2026 15:02:40 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com,
        deepak.singh@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,shikra-pas: Allow bam-dmux
 subnode
Message-ID: <20260728093240.rbncqxse2nomvbrt@hu-mojha-hyd.qualcomm.com>
References: <20260727-shikra-pas-bam-dmux-binding-v1-1-c0159c7c3ed4@oss.qualcomm.com>
 <20260727144105.t2yz4jpkuiykem3a@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727144105.t2yz4jpkuiykem3a@hu-mojha-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a687742 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=m1b5yMoVOdqxLKxJPrgA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX9okUM+jVB9x6
 Om8HdQ7TnQ2kO5RB9N5hjSnhZ+HH1H5HrP88V3pM2rQIjwsBCFv/Dc7DtPQ2d0hatFJnfka+HPx
 S0haTI6pMkndScQQrXLZkMVXXFatPwB8VNvz67aLPyFxyn6fFYmqZ1oj5sLAAC0aCtOUX/EncPQ
 hHD2R1wNVhFZE2fPPsLbQsVEdmSTJLudt/fux2ORH2TUASMyLc5whwHagcSwtWkmndJfxrfqYMo
 JbkHhGlUl9VGqcXBXyauMOl2pRQk6/9+Sz6w0kvRZaLnwkAoWlu5uY2AlpSXP53vpxrRCq8w/Gr
 nFSr+mXHbjhrgFCZMyM33tRLYcmt2bJR4asyDYQ58nLjU4YeJ8HeKyu3gwZSGAW+btGPhDsgHUI
 X8lKhzP04DmhnH2aAKgbYRzJBpPB60xpc2srL4Jrfx1lecnqmo5p2qxHcoeQRedP10c2slcnNEg
 yskPpXJDKuM/TgVxskA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfXyNQMybv69jff
 6T5nErv21iwzs1lEwYLdpMI9FIe7OyTHgM+xLIwylghKZ7+wHCyCHUisoXDI0FtwnBjKYl2MNDc
 DIx4r/FW3kOWNGTUzv9NVIfykG8pRmg=
X-Proofpoint-GUID: LXu6mLlvOJpqT6r8_UksH4Pooqk4EVD-
X-Proofpoint-ORIG-GUID: LXu6mLlvOJpqT6r8_UksH4Pooqk4EVD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280082

On Mon, Jul 27, 2026 at 08:11:05PM +0530, Mukesh Ojha wrote:
> On Mon, Jul 27, 2026 at 07:47:33PM +0530, Vishnu Santhosh wrote:
> > The BAM-DMUX node lives as a direct child of the modem PAS remoteproc
> > node, but qcom,shikra-pas.yaml has unevaluatedProperties: false and
> > does not list bam-dmux, so any DT adding this subnode fails schema
> > validation.
> > 
> > Add an optional bam-dmux property referencing qcom,bam-dmux.yaml,
> > mirroring qcom,msm8916-mss-pil.yaml.
> > 
> > Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> > Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> > Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> > index 253b14eb2b598f0ca91854c8ff4d0b785090e621..17461d92165b26eb669809ed7dcdf029530c9223 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> > @@ -44,6 +44,11 @@ properties:
> >        - description: Firmware name of the Hexagon core
> >        - description: Firmware name of the Hexagon Devicetree
> >  
> > +  bam-dmux:
> > +    $ref: /schemas/net/qcom,bam-dmux.yaml#
> > +    description:
> > +      Qualcomm BAM Data Multiplexer (provides network interface to the modem)
> > +

Sasiko has valid comment on this, please address.


> >    glink-edge:
> >      $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
> >      description:
> >
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> -- 
> -Mukesh Ojha

-- 
-Mukesh Ojha
