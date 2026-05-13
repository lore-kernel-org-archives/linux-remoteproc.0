Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E8B30B509
	for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678779; cv=none; b=EpCRClekafWPVBxmpfdJeRv52SOmv3VCeoKWo7sxh+jhn7GS6FVn6E05L7W4rRRkH+udTc+OtExFG5Z2uyL18kIlQ6tjttL0aLVaOf4huBDgvTnG7tJYZvoM4jl5mcWipT5+G7ZT/s38Zwos0BZQ1lH4GawwBH3Yu5/KNO62sv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678779; c=relaxed/simple;
	bh=iAJWuYbMSvTROXJv3+FzvaZZ+BZO08pNZvCxfks3kuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7zoQWxQHbCA7xOEpN8r5Xy9FYpgvVrt3Vr5XiZPI4o5US4+eXFG9JsnBG5Gx6Hp5yp8VB8U7uHuqGhv5kWsdQrNqwGdH3dpAGhpbZQOGJwzTyqYLoRr6qcwdBvE+NjNTi426JEl05txY2laq6lSp7/DvGlMemE6lV6WCz44Qqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2+sVBYm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdRADfFJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k2+sVBYm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdRADfFJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAW8BB1393026
	for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 13:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1A2JIuivfxTHNE33J+4ZfrSn
	HuAPEzqRV86Vt32AWoc=; b=k2+sVBYmVZ6IQNmSNTSEz1M1qd4wswCJFFvnyNxc
	kR7lMnI/qoifc5tBfwJtdRKCTTiGgdsMz53yoebwClcfnY4u2z7KDVV8N0s5w8pM
	W8cKzo6Pyw49XSwLNl/sGtES8RtxR5OCVPg+6l6DrndShstRX+wLtSHhICzhmews
	uiyfDo5q4si49V20xzR96tc/NOXPeH4eyVCo+zdiJIPFh4emrffgdjOMqnK6ZoGV
	oJ9ZRRaP4uFdbrNL+30g4uuGP9zSrK3seLT8SuPK1egfaPDPK2XirOkRWhQ/qoyn
	8L7rD/LIjoc0YeAGlxRJ2/m/+QPHuV5C/YWW/sNOMVpgvg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k261tk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 13:26:17 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6374098885eso1511561137.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 06:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778678776; x=1779283576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1A2JIuivfxTHNE33J+4ZfrSnHuAPEzqRV86Vt32AWoc=;
        b=JdRADfFJg+MGX5JTGsYIaa78a12PCFWERcGH5btDGJN5IOTWtLMMxakg5N5dzimGNi
         6K99e/KOonY4q8djOmbIt5eA4FIlm1QESNQmsiD3R6vTjP8Upb/AKhrwm6Axgr2iT9TI
         0q2i2k/KZBdyxEbPYkrU4WnRroZ6TDuEgTmIZwf+e2gMI7Y6/IMVG648C8N/wik3KKsY
         JRFP356xPrhTBSvz08uS/lgymt3YzzaTzRiq/c9gmBW+AxWmjrzYPVcm0oPP5p9x4Jqs
         Gd1tRVPc2jzXJXZJpc8J2XGtDp4O3ShErtJTFEeSmJArEjEowLwLUDZJJHQbTrmWXUsy
         Q9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778678776; x=1779283576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1A2JIuivfxTHNE33J+4ZfrSnHuAPEzqRV86Vt32AWoc=;
        b=ZxkHZrGbpFekdbjP5wFEGeGKJeVTttGBbYSpcca0QxQ+eXgBtl0j5goqsqXyX2JbmN
         bqO5u+Oii8ODcsfc7daNubby3Rz+9E7HgS2FUcWOoCgDIkZiWBpxZus5cJd9aBbJj+gV
         9BN5KWlaKzTrmNDyewdxvwCIJ22nz7mlyv4V+AME29aDpqagRDphe80Efn2O20Om3I9I
         UnL66ChtDlltZjKcXlYgCLfmuuQsDtovOvHE5gGcxhfAizpEmoRwLKU42VxJGT4y8oqM
         YXSlNo22XrfRyE4HOCQTc9GUpAMKbqSk5Z1b424lDo0mbttXYbo+hGbb7oR22uri/X/8
         bHuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wZ1jKcwY1DA4DTyJq5ASVXY6vA2YNFnRevnOxfWOVBdZrKrxsXFap+2mluVFOwlU1XahJz/uQrm/ALGCrVBhm@vger.kernel.org
X-Gm-Message-State: AOJu0YzpWIOvvwDA9fpsWKQEx7gjEDZdjrEKUu9qrSD+bwghUqSoEQ4R
	ey25Gzqt7MtNmstQt5fdJGg7UIBws2zD3jBZsxbOuv1Irr06ITrqRJzaugYGlWeZmfMYeycJK2B
	BK7ARqDTp2bg8wvJEr5pM1k0Ey+a5edKEq6ElYzEyqVuwf+hbLjV/QPFLX2MZhQX3Nxg1RP5g
X-Gm-Gg: Acq92OEwmYHtMKpl7gJ10rRGVl/BjFpdB5K0ZiqDbSDBjGXaZ6y5UMmQgeZzGKpbfuS
	Ks2ZChL9l0KJqXcx4PyUajhHuBlNfpsJXYoPgOaRwGHr4zg/XFaukxkOOCjj9cZ7xOAdJ8ykbwo
	5xEAO6QTlfHeaXCL3oZsgF++layCfB5IBEPoZS2zhA4fixAyH+yNc6Xk5PQpr66cQ2oTFW/zyH1
	l5IDDwULsTF+7a/JbiWB4kS3zptKGB4APzcEZvquqLEVVKmoGhb4CbhP/yBsweHND/CY9NgbpTt
	JOTvV5eFC2/94JPXNdJogcRCE3JWFbVKvdjfPR3qJAosJ0Mjmkh6eCbRVFnao/Y/A15P7R0gSOb
	UdVEqH8CqSHAyOHhrsALj4fjtYBBJ5Tl2HJ3XGwQdVAJoZvia+B6skPqOJfmnbheqBvV0q3kCa5
	pKinUPMPdWkmfU3/BbEnoiDC97fBmp/RZfZ8k=
X-Received: by 2002:a05:6102:c4c:b0:5fe:af0c:79f5 with SMTP id ada2fe7eead31-637733e73b9mr1509854137.5.1778678776009;
        Wed, 13 May 2026 06:26:16 -0700 (PDT)
X-Received: by 2002:a05:6102:c4c:b0:5fe:af0c:79f5 with SMTP id ada2fe7eead31-637733e73b9mr1509786137.5.1778678775359;
        Wed, 13 May 2026 06:26:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db2f3sm41011661fa.22.2026.05.13.06.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:26:13 -0700 (PDT)
Date: Wed, 13 May 2026 16:26:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>,
        Jackson Lee <jackson.lee@chipsnmedia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Detlev Casanova <detlev.casanova@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Heiko Stuebner <heiko@sntech.de>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, MD Danish Anwar <danishanwar@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        Parvathi Pudi <parvathi@couthit.com>,
        Mohan Reddy Putluru <pmohan@couthit.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michal Simek <michal.simek@amd.com>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Linus Walleij <linusw@kernel.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
        "Andrew F. Davis" <afd@ti.com>, Hussain Khaja <basharath@couthit.com>,
        Suman Anna <s-anna@ti.com>, Ben Levinsky <ben.levinsky@amd.com>,
        Tanmay Shah <tanmay.shah@amd.com>,
        Erwan Leray <erwan.leray@foss.st.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Roger Quadros <rogerq@ti.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Consolidate "sram" property definition
Message-ID: <ldpcnzvloffhiubmv6zxhfzqo4oz3ntkmav6zjprmbnsrxd46z@t72iga4xvaji>
References: <20260511165942.2774868-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511165942.2774868-1-robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a047bf9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VwfjHJzzgIKQiJfiZN8A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzOCBTYWx0ZWRfX6JUruzDNr2DP
 YjXUTU+pHmcGT3qyP4I7tdly1e1CtnjgE7HrJGWKhK7bZ/YqJIvTkY1AeuSkDI903T/eGIIEVch
 fCWDjsaidLxOFCiRmJ0HnWcdS+44xcF3iacbTXGuA9ihaSGL2Kcb8JdWLBbNDqTFt3IVe4pj8qz
 qslVEIOBMlOMYTtwZPY5Jc1q3Bkr0muK82Asnx5u3YgKEeeWJtPMoBZUwCDTXhiiXojbF7+m/qt
 gCOoGw2ydjE50RH8Uh4pE2aDwkCMdzmal3Unt6hoStL2cJvtSY8qgQZquO+6iYITyhCZQRCXPnN
 XPLL2Qn4bL/af1ZAmui/vdYDroC+hfmk2lUR1VSKndEDBOLHmdD/LSskEPxYBLmN2dUNcEml4gE
 akLYRbUtj3WdQmpf73mYPoTWt4BQJkbkKOVJVyNcsgtek1kaR1cU7Bo61erQeDAEHqRVuwFkxfi
 esjpd3YA+bRrMYy/3vg==
X-Proofpoint-ORIG-GUID: t5HBHfoqw7mq2GZbShyPy332N0o5G2A9
X-Proofpoint-GUID: t5HBHfoqw7mq2GZbShyPy332N0o5G2A9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130138

On Mon, May 11, 2026 at 11:59:36AM -0500, Rob Herring (Arm) wrote:
> The "sram" property has become a de facto standard property, so create a
> common schema for it and drop all the duplicated definitions.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../imx/fsl,imx8qxp-dc-command-sequencer.yaml |  2 +-
>  .../devicetree/bindings/display/msm/gpu.yaml  |  6 +----


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # display/msm


>  .../bindings/dma/stericsson,dma40.yaml        |  8 ++----
>  .../bindings/media/cnm,wave521c.yaml          |  2 +-
>  .../bindings/media/nxp,imx8-jpeg.yaml         |  6 ++---
>  .../bindings/media/rockchip,vdec.yaml         |  5 ++--
>  .../bindings/media/st,stm32-dcmi.yaml         |  6 ++---
>  .../devicetree/bindings/net/mediatek,net.yaml |  3 +--
>  .../bindings/net/ti,icssg-prueth.yaml         |  2 +-
>  .../bindings/net/ti,icssm-prueth.yaml         |  2 +-
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml   |  7 +----
>  .../bindings/remoteproc/ti,k3-dsp-rproc.yaml  |  8 ------
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  |  8 ------
>  .../remoteproc/xlnx,zynqmp-r5fss.yaml         |  9 +------
>  .../devicetree/bindings/spi/st,stm32-spi.yaml | 10 +++----
>  .../bindings/sram/sram-consumer.yaml          | 26 +++++++++++++++++++
>  16 files changed, 48 insertions(+), 62 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sram/sram-consumer.yaml
> 

-- 
With best wishes
Dmitry
