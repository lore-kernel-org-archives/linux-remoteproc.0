Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389749;
	b=ki3hWC1L/BbJybPXIAZZy3xmiVaK/WCWCKHW+BY7MQO/hu1LBmE+fK5Wi3657sox4R+c
	 7zY5GgdopKmHCX3a+eWR5jiEs6feuhIertuHK9i/bhBPLFVaet4F/wKXXHixgVkSje1fK
	 N76nA/z0rj4HEBYSy70vyPbN040YkdHAWNUfGYquZI4HlKkBv0+m82gJ6HIawWN1lBWDg
	 rgcPwMx4xvu51fqt8x9R/szUW+NKMd6cBbIEVBOiTf1oihhaaVjXkXk+XhdsJ6dScXoiG
	 xdk82w93Zf8vtUP3dyR3+i4lRjG6i7lsSMQYbFRFuQkS3fyzQFXq42S3O+ZsYSvgk6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389749;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Z8g4xiibKWQuuJs7EMwmXcAQgq7/Z7zwBqVvlgwyNzc=;
	b=bvXA+3gHS/TxJt3JtKpev0fPlcNdiKPlJeVzFAnrh95P1Op18SFVsnAaTmqYURX7WJBF
	 mgWF2fr7GGAgo8sfG5BSKk+dJ+EVKOKKovMUFPtQKGDxEQEvwcCLoFnO/QBSxCjTtVkaV
	 g90g68UN+Tfy8/SWR7lE+DCA1R8CwHn5DMon20m0VigB178OjPzd+soeSy0n9KzEdF6QM
	 oXum3Dky2b9GuUtpKO8c8DJAWw366/CUpAW9yY5OPK3P6dM65SXbSZNsdTEdvY8ji6HYc
	 rN1Yt+6PkYLWHZGTP5uh2qljsE2QbmgPUYZ+IgyPirGjfHWAVrm9NKfglBle8Ge53hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yPk7oTaK;
	arc=none smtp.remote-ip=44.202.169.32
Received: from omta033.useast.a.cloudfilter.net (omta033.useast.a.cloudfilter.net [44.202.169.32])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF8A606A31F
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2026 19:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAF8A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yPk7oTaK
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id MqBzxxEjRPG7QMsb0x7XVo; Fri, 30 Oct 2026 19:49:02 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Msb0xYQ1W0ULmMsb0xdnkT; Fri, 30 Oct 2026 19:49:02 +0000
X-Authority-Analysis: v=2.4 cv=JJw7s9Kb c=1 sm=1 tr=0 ts=6ae4f4ae
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=OuZLqq7tAAAA:8
 a=EUspDBNiAAAA:8 a=3OfnbWqpRXkE7MXKp-4A:9 a=CjuIK1q_8ugA:10
 a=AKGiAy9iJ-JzxKVHQNES:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z8g4xiibKWQuuJs7EMwmXcAQgq7/Z7zwBqVvlgwyNzc=; b=yPk7oTaK9jPnNUqNMPC6twzpsT
	nytbZs7aIA1qfH8e9yM5XmhTrSl/cYbIZ9RliN0XK6PH+8fH6iMHI1gCwt/eOdzUc49xyR7pm2jYG
	R9wLgSVekO9zz7XW1C3SjWJ2jdanQoPmO4H3xTNiPdbDJTuDCzQpc8aBllvgvys8U4au70SjQAcVr
	9kcENVpW6s4Z+c++LnSDgqh02SbHMxe8Bio+xFCpQVb4Mg/zNG/QunFRcwYu/SoYh8Aehzm3qPknX
	EZ4s/wFn4ZXU94FbWoY7yOx8zm4QD7ylqGwONkzT2WrVTWpzZjoPkVFtX5kt1BNNAWsdLe/GcdbYI
	A7exSNtw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44054 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMsat-00000003tHT-0RvI;
	Sat, 31 Oct 2026 01:18:55 +0530
Date: Fri, 30 Oct 2026 12:48:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v7 03/11] dt-bindings: watchdog: qcom-wdt: Document
 MSM8952 watchdog
Message-ID: <7ba73247-d832-423b-8020-21cc135cd02b@roeck-us.net>
References: <20261030-msm8952-initial-support-v7-0-ad748ace375d@mainlining.org>
 <20261030-msm8952-initial-support-v7-3-ad748ace375d@mainlining.org>
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
In-Reply-To: <20261030-msm8952-initial-support-v7-3-ad748ace375d@mainlining.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xMsat-00000003tHT-0RvI
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:44054
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEdy+XfHslbX9PXR0Z6U2RVcPtpK7djbsaaPHGlY/6xzRava/wgZyk3AeeQe30ZvjepqRrmpY+RadNEVnk/TFHQmtJnka/zx6Hb0oj6zmIoHZqnFqPwk
 RFg0PZSwltP1FHiGJac68cphnAoOROpwc8at1s4Eg1jN6bTC+KQgi9QI8b2i9ocmQm14HXcOfr8SDeITRGHjSa1qz6CH8W0/+FoARHF82vz+pHklxnE2YnZ5

On Fri, Oct 30, 2026 at 12:02:34AM +0300, Muzaffer Kadir wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Document the watchdog found on MSM8952.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
