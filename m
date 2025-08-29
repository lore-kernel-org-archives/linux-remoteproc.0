Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6363218C5;
	Fri, 29 Aug 2025 15:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480017; cv=none; b=H0UzAsbFW0Obs5HPlkOq/LCbr4F46cyEjGL5E5lewUf0aWYNrVWYJf+JHWpAAziovvbwE/+hNZ2PCfR+XtNPzoWSRO1wDe6MPAhSWaF7WElRVDzTMAtFB20hG9PZ0WhCQyITYY3Negu5dAoW/j/XzS5dzOPwXFrZQa9WK5rc1tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480017; c=relaxed/simple;
	bh=0d8UuK8zHiUX85nUGp6oB76FtqUuTIyEA+Ua7Pj2hVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiITig7OXUwBrqL8U5PhggOLACQ9rxYJL7IamH0TRBLOvdtSXxyHqpO1fafw0w5SR37vmcwrsz0v03GEJsTqI9AocCFgR1kxv78aovyGc3qhNKFCVTiQzkx6ErLoueOs57jgGsAVlnI7tIfSRtsHK8/1ns4IXEQH0NcE5C2sI0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZv4R8T6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZv4R8T6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2838C4CEF0;
	Fri, 29 Aug 2025 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756480017;
	bh=0d8UuK8zHiUX85nUGp6oB76FtqUuTIyEA+Ua7Pj2hVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RZv4R8T63sYSP22IGdTAfZk3RKBxXmcUCOcz1VWJYvkjQsx4JtMIk85tvw1zIfqIr
	 /M1Ms8Tn55fEUW6lbJfyuz4x5a8CHyPmuUVxhcVF4j+dvapp/GPmwaIinS7zattY8Q
	 GZsAEKNWkEYAzaHxPWvKLxJQeQ7cGZ2Eh/rPt3kHZtp1NZDYMsDNl1En5wZCisTUdn
	 8ptwDsWO+SgaXMixbXYLapFuCqzBpjb7xEmR0v63O3u77mzfnzcym/SwGxtDleB7lS
	 newQXL5VuHN3DTehzzxLRrCsRsBw4/djxdJaV15dxrvKl7GBC9ZjAX1StA42PPAfPC
	 +TmZnFdPBZkuA==
Date: Fri, 29 Aug 2025 10:06:55 -0500
From: Rob Herring <robh@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <20250829150655.GA782291-robh@kernel.org>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
 <20250818204420.794554-2-shenwei.wang@nxp.com>
 <20250826200904.GA375876-robh@kernel.org>
 <PAXPR04MB9185EAFBDF13143860910C3A8938A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185EAFBDF13143860910C3A8938A@PAXPR04MB9185.eurprd04.prod.outlook.com>

On Wed, Aug 27, 2025 at 02:49:54PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Tuesday, August 26, 2025 3:09 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
> > Dooley <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> > Hauer <s.hauer@pengutronix.de>; Linus Walleij <linus.walleij@linaro.org>;
> > Bartosz Golaszewski <brgl@bgdev.pl>; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> > devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-linux-imx <linux-
> > imx@nxp.com>
> > Subject: [EXT] Re: [PATCH 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
> > subnode support
> > > Each subnode within "rpmsg" represents an individual RPMSG channel.
> > > The name of each subnode corresponds to the channel name as defined by
> > > the remote processor.
> > >
> > > All remote devices associated with a given channel are defined as
> > > child nodes under the corresponding channel node.
> > 
> > How is each channel addressed? Are they really grouped by type first (i2c, gpio,
> > etc.) then an address within the group? Or is there some flat channel numbering?
> > If the latter, then the addresses in the DT shoulc match the channel number.
> > 
> 
> Yes, the channels are grouped by type and identified by unique channel names assigned 
> by the remote processor.
> 
> The RPMSG bus dynamically assigns addresses to each channel at runtime. Because these 
> addresses are not static, they cannot be pre-defined in the dts.

But you did define addresses. How do you know which channel 'gpio@1' 
corresponds to if RPMSG dynamically assigns addresses?

Rob
