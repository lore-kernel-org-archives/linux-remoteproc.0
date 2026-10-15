Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723E81922FD
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 00:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792023693; cv=none; b=C7Xz1nEdvsw4RJWkOEu7BjYmTJCYY9uEweNeEFUafeYigFkwFi43L3MtnjE16E4hLSGNSZsmu1N2ULsSfYvDnBEDY4/ZMbKpuvvNTtD/6bh75ElHkIecFtWUjy/8tDby1qWoxfJG//5+RuOB3d+FsXWgPW1iTYZoGxin/vuPElw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792023693; c=relaxed/simple;
	bh=gi48cupS9h7XgwY6WPv+vOA1JVj5jws7mmQ9ojMZxPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASOmP6We6awTiadO1kRBDrNBbmja2tfz89ep/byieH+rfdVVwA5/yVltyQ3lva+QVoZucJg03aYyW+7gfc0conjcrs9gDp/7i0o3H5T7i0yqZ2xQlT7W0sFzHV36WTVxA0mTZ1Ht5Mml5tToeBWnMWJQWElDG0sjnLTu/rSM1cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUPkFvBK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e3Ucbvk6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUPkFvBK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e3Ucbvk6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMXc3w644607
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 00:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yaR/N3Tfnkuz4eGTVgBjs3mV
	pu7leTe1gRB71C/CEt4=; b=jUPkFvBK8Bam0QI2S0E5fz7hd/W/N6wZ8bCVnR7/
	awYjOYzdM9FpkunS4kPxLOXogbp5CIpClvu7+7XlbeR4hguUzz2h80W4lpE6RH4q
	s7aRLQZ9miMd6/KDpxUkB4Pd6zTcXCnID2VvZWeRYp2GdIYmG7ekI6SuXRaWJENt
	+f+aXzLW9kK6070UItNSO+5CgsLUjLjW9ffe3yB+0+34CFjzZMZoNMTWLTxkKiYE
	ElZeVX+Rqf8LwknyMqsgiHLvYLsyuHsC94egr8H99NzyIuHtKVa0FK+ME38Hr1HN
	em4bHhw/fvXcfhrLsGLI0vnv6cr3j8H7JUUjisV5aISgJA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmy89mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 00:21:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso7135311eec.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 17:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792023690; x=1792628490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yaR/N3Tfnkuz4eGTVgBjs3mVpu7leTe1gRB71C/CEt4=;
        b=e3Ucbvk6YebkuI3xSJzkF1JAhvFrjdS3lRofY+jCEiyOT26XHTRE+7ubzgS+OMgcZm
         rr1VupNsqlK9hq1B8PciFUbg4ZLBmp532kG0f0vauOG52+h8Bm0tfJKmXE0mj9KRLfRL
         AjVaOsz3x3yukWn7vwr+7Oz/G5xcvSLqU7lLefrRm++zMurbAE/n/1qQuOwA8IAezXCT
         TtaIM4Ycur5syVKgUXOYamd2kVGAJvdE7pciana/5h4imIyVj37eOhEn6C+53/A6opCU
         G7xpZiBUPY13xZ5gvE5TFLHCSbYxN2FYSi7ecAY+ddOSTiw9lECQlWtgema0Mj2ZQ1bd
         /jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792023690; x=1792628490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaR/N3Tfnkuz4eGTVgBjs3mVpu7leTe1gRB71C/CEt4=;
        b=LUrN+XExLcszxEAveMGOHuDZ9UPcgir+8kCeoBjUL4V616Ib5Kgzb4DrebD2VkkhG0
         dFmZDrBLH7XCYci5lbfFcPB4fO6XekKZUx3a+iRSIVaKlyEHgXe4o+gysJTzjL+qLc3e
         IFmphfsUBs2GNrGNwC11Z4eAfPcNqE/mqyNp6dip3ZJ+Z3VDAKAOAYmLX/2PZ3gqdleV
         bLk6abEblMi/P26e4M/L7GNWetVr5Zha10jA8R2dUnKP1g2nLTnnisKNjuO1XGjL53Dy
         JN/0BR714To3qm0V7a7IQmlzYwsWGrkfDGZ46XVAR7vrymHdht2Qne+pyA/CjuGc915O
         vQvA==
X-Forwarded-Encrypted: i=1; AKwUvBylR2luR8pSjFhETG/KwaZhgsDc0HwF/TipmIR4tATmeDt5wSLtA2kpij4u26e2mzjaOdStNKlivefcP+g82IMH@vger.kernel.org
X-Gm-Message-State: AFq9FYIchzNk5fw44TaL6aFTblKuc5EPwUSEhFE3V9OKikw8owm1Og1t
	+EO29oAqf2vl4wWY9R+LRPZwSk/sb98FiD7BI0PrTvrNYi8eukLsxj/B1XBD1QgFRrwOVdImnA8
	I0gwvK5VH2XUzViiHlXbbBCn6eDD23RZTvmTt3SnJ1dQL7CePAjUfKtnDVsUkivFEXUf+wqBU
X-Gm-Gg: AYBFou0kDElc29yZ93cY3ej2irv0ifkZqWbrJUJ6TovGi5c17VieZrbNAYyki3GKCD3
	S+VmOl+8IkitAFZfx/D2BtV7JNDCNKdsYsQ7uq6q2gndzyJqLOFvsuX7yiJ6epNqYukOZ0fIXa4
	XZWGCiKJKXx7UGs1qTwrYP01BqIK3bOD/hPU7J+x/sbaRerCJ4I7JUGcAsRwn29ZWu5dQroqm0d
	PiYBLqS6Q2tSMOzythN0a64HDtiHbuDJFkh4h+qIGdE3OX+H4Ub414TlJE4KrLC1aFPF51nScxo
	Qsra0yv/TEzpUDWzLutrRQ9cdAT2OBBEZSXPmWvuUy4IudAVcEwLL/agD3y2pOI22r87Zb2xdZx
	jE0uRPN5n9csnsFde5+DWLAXDLiN7VYHJt7/wEPXC/A==
X-Received: by 2002:a05:693c:409a:b0:33e:a173:4aab with SMTP id 5a478bee46e88-3537df8cd39mr23615311eec.14.1792023689897;
        Wed, 14 Oct 2026 17:21:29 -0700 (PDT)
X-Received: by 2002:a05:693c:409a:b0:33e:a173:4aab with SMTP id 5a478bee46e88-3537df8cd39mr23615268eec.14.1792023689239;
        Wed, 14 Oct 2026 17:21:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-359789fde97sm41347836eec.20.2026.10.14.17.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:21:28 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:21:22 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support
 for SOCCP on Nord
Message-ID: <atAcgjjlin21jUHa@QCOM-aGQu4IUr3Y>
References: <20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com>
 <20261014-soccp_driver_dtbinding-v2-2-09d9c1378e9e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-soccp_driver_dtbinding-v2-2-09d9c1378e9e@oss.qualcomm.com>
X-Proofpoint-GUID: NxV3P33hvWXWvFlFdKxkU0ylliskf4yE
X-Proofpoint-ORIG-GUID: NxV3P33hvWXWvFlFdKxkU0ylliskf4yE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAwMSBTYWx0ZWRfX5NgveDEA0UDM
 NILpnQivemElpdUqEKPyKAM3bgJ+3GTpAoaVf746qUEwWw0jaY0X6jISa98TfxEoKNisLb0knuY
 QbS396DPTr3vwe0e4TuyWX2WDbDFYdU=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad01c8a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RuunLgntBIPE6M88tmEA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAwMSBTYWx0ZWRfX4SmyvMDll5Vi
 cvnBTa0ABdqkQZQ6u+gMHRTUYZZV1sO+aj29OtxOgEj3ibdhoBIRLNpyKQcvhP2GTTfYGtuKtHo
 xJPA6a+YEZKRK9h2DW+6fZB/IZrqiwu34StokPaJG32eldxOLywdb0grkU4RMjEx2wMj7rs9L2S
 oambkwyutRyzsAqX+gufljp7KEFdN90lqwJNs0pKWrBEfyPYCoMFla6YNgdktNNKl3jY8wcASZb
 hfZR4crn42txb6U3NSbFO60W0i22zhzi06gf2H3EqCrTXQwWkjCQT6PF1bNfN5AaCBV0VwXbyiR
 cXlTxw712aSozo397bmnD5BblC54Bb0xR5aUpuWUI+F6piaThPi04OzQgti8cF9nkRUbapZUgt6
 FZ8Nb3gfdtSa9Jp4WKgi/EVgt3m+VZxnNWEeU96KdJ8mgJ/PE+kUlG7bxXqapcalG9xOc+P0rJI
 fCZfbiHx4fBMEdj/CZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150001

On Wed, Oct 14, 2026 at 05:16:10PM +0530, Anurag Pateriya wrote:
> The SoC Control Processor (SoCCP) is a dedicated control processor
> that handles hardware fencing for display and other use cases on
> Nord based devices. For Nord, SoCCP firmware ships without a
> separate SoCCP devicetree image. Therefore, it takes a single
> firmware-name and memory-region.
> Add support for SoCCP PAS loader on Nord platform.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
