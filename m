Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC291FBE86
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Mar 2025 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741856081; cv=none; b=s+dJI+NKqtuEcYTt1KOek2Io3wkO8t+Zkj3dA7MHCZU/onpnCoTC6k4qgO5o0hvJ1qvwpneDgr4NsdMof6buwzhdXk6wBdDav7lI8HFIR1Wz3WuveMgd+T6xtzS2kmV8KQH802ertVgpDGIwDiM0lR5r3/tHDGlTsESWgMbggrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741856081; c=relaxed/simple;
	bh=Mtsg04ahUEYyeV5JwVGj733jmCr9/jhyx/vmXj0i19o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m4tPmwjY/sPAnrgku40tCwHbF5r1qs7oNyKqaWDV4fw5U6H5y76Rc4FowajO63jYwFPsYH4iDXLMs6FgIm1HV/mSZLkH99S0xJ6v6vceHacT9/oyVqofLpGFla80NB7UtG85N2RWLPKG2u+Kh92/TmXFJOw5d38q8EVq7Uen668=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseKr-00025H-Ib; Thu, 13 Mar 2025 09:54:37 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseKr-005VRu-10;
	Thu, 13 Mar 2025 09:54:37 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseKr-00041e-0i;
	Thu, 13 Mar 2025 09:54:37 +0100
Message-ID: <a37615a87d242df0ad858e3926f33e4246bc00ef.camel@pengutronix.de>
Subject: Re: [PATCH v5 0/8] imx8mp: Add support to Run/Stall DSP via reset
 API
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Daniel Baluta
	 <daniel.baluta@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, shawnguo@kernel.org, 
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
 Frank.Li@nxp.com,  peng.fan@nxp.com, laurentiu.mihalcea@nxp.com,
 iuliana.prodan@nxp.com,  shengjiu.wang@nxp.com
Date: Thu, 13 Mar 2025 09:54:37 +0100
In-Reply-To: <Z9BkbVHlx60VFD7q@p14s>
References: <20250311085812.1296243-1-daniel.baluta@nxp.com>
	 <Z9BkbVHlx60VFD7q@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On Di, 2025-03-11 at 10:27 -0600, Mathieu Poirier wrote:
> Thanks for the re-spin.  I will wait for Shawn and Sascha to review their
> respective bits before picking up this set.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

for merging the whole series via rproc.

regards
Philipp
