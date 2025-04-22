Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808E0EAFA;
	Tue, 22 Apr 2025 03:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745291267; cv=none; b=p3jFmXf8uGZdW5fXCQXY9b5GGozP1D6sMe3o1uBxCY1YR/ggq9SQ7bSeomBCvS1ufry5EcPhQOE1IpKzPWZYZP/m2ejEyX5ccHisFkW/ikqKzJwYrAcFJdeeh+KaxoAprpeMhgAvctQp4cBd56WVoy/WwNRUNz0+EY+/HbdEQ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745291267; c=relaxed/simple;
	bh=hDLIaVfCxpkNARq3mDMRwM8hQH3+H+6ffO0Q6/SvR/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvogLW0vTftTbQ5YeleIkJJD9iVzSYcjCsYzzdeUXSP2S5TdDR2rZsJBufjKDd3XXlWEYipcwDp2Bmibwy0G7+tCvNzrz0h2guotTT71YNBUGwaq4Ii2SOkLHrnyK9sYSblKOTMXsWV8E/JodrfXt4abrNtGAAa68AXjQLJnK7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=WWBOz97n; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="WWBOz97n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=n/JvTCs/sCVXGz6hg3teVfW2as6Q4XHGy/um0GGV72Y=;
	b=WWBOz97niOMrfuAQf948QNWtsLZb9k2XaXOOyu8avbFG4LiblVDbZQnmyDbBF+
	TEzEtT4BJdWMlk0tF5t67UTUQFFVM2GrVC3dtXZUMDyi6q1m0ZQBKkE5GZvdC+E4
	H+R5SViHRoN16UWNs4aptgkEw1WBKo77y+v4OvUtuBwPI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXbUbXBwdoi1GrAw--.548S3;
	Tue, 22 Apr 2025 11:07:05 +0800 (CST)
Date: Tue, 22 Apr 2025 11:07:03 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	frank.li@nxp.com, aisheng.dong@nxp.com, daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com, a.fatoum@pengutronix.de,
	mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 0/5] Configure imx8mp dsp node for rproc usage
Message-ID: <aAcH170yqRMMwVXe@dragon>
References: <20250320121004.2542314-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320121004.2542314-1-daniel.baluta@nxp.com>
X-CM-TRANSID:Mc8vCgCXbUbXBwdoi1GrAw--.548S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUTHGQDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBB83ZWgG2pu5jgACsT

On Thu, Mar 20, 2025 at 02:09:50PM +0200, Daniel Baluta wrote:
> Daniel Baluta (5):
>   arm64: dts: imx8mp: Use resets property
>   arm64: dts: imx8mp: Add mu2 root clock
>   arm64: dts: imx8mp: Configure dsp node for rproc usage
>   arm64: dts: imx8mp: Add DSP clocks
>   arm64: dts: Enable DSP node for remoteproc usage

arm64: dts: imx8mp-evk: Enable DSP node for remoteproc usage

Changed the subject a bit and applied all, thanks!

