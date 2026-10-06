Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87D223F40D;
	Tue,  6 Oct 2026 03:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791256062; cv=none; b=MzWQbw5KxNCiTXAjCK569WvIHmbwA5PK53SeakgoWgoybYRf/+IKCSLNIydQGWGhsfE1g8xmzTVJRzTZoqKbycjCznb054PQPmKd5QparaZwCCACDNKkIqXzpJP0nzCueVhAvk9VpIVeOMgOqhQFzktLvtvD3++fmTBwsAGVckk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791256062; c=relaxed/simple;
	bh=u2XCzotyA0eoBElwqJaT+54SCaHMsrFBPsSNw3/z2m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZWt0WsgkvPuUbSZVRyV34llSYrkb6wxxW2JRFEEyqgmcddBv+tOs64gSt4Xu3BxI/0EvYz65EW1gzhVJuWmH0a2h4gmNn5ABH3LBMi3QbEu9o9JLogNllYqVPa+yACbZ54QR3o5MHyib/tgkEfzOxL5hFM7P/wDC43CuGzp2Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E54qJJP2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E54qJJP2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A291F000FF;
	Tue,  6 Oct 2026 03:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791256060;
	bh=HT4hgzsRMKonUz0r7afTuTXPpo+Txgw6N/Uo97ww8Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E54qJJP28qC99NMZ0qdbLZhIg9vlRfrTPOR4d7Cb6K1eiSttfjFpIbEZJkioPJLyQ
	 q7IDB6EDOVNlYQDXr12O3myoiSIGc7B1BZED5b2/Ee/WoNkHcYNCDeTwm/chRL1OJW
	 oDuLTqzx7Kv1sk6k56EZ+X70uK9ENLVZEzY3hZ1NKBvJZ5GIeQ75ymDGvCO2zqb3oU
	 3OSvSRbu9vRoZdzW1mlxKzwXeVBZ0uNA7p8FGeuiNuIO6g07kqlMl6viI2Wengv3Bc
	 FhnmWHa2F8MayuOMNOs55uow6joWJzqCEnv767UbJlGDaZicYCNxi8kVvRn55z5xCr
	 75MR4aTQI4xYA==
Date: Mon, 5 Oct 2026 22:07:39 -0500
From: Rob Herring <robh@kernel.org>
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v16 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <20261006030739.GA3457522-robh@kernel.org>
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-3-shenwei.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923184255.299034-3-shenwei.wang@oss.nxp.com>

On Wed, Sep 23, 2026 at 01:42:29PM -0500, Shenwei Wang wrote:
> From: Shenwei Wang <shenwei.wang@nxp.com>
> 
> Remote processors may announce multiple GPIO controllers over an RPMSG
> channel. These GPIO controllers may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
> 
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node. Each subnode within "rpmsg" represents an
> individual RPMSG channel. The name of each subnode corresponds to the
> channel name as defined by the remote processor.

Sorry, but DT defines the names of nodes. If it's a gpio-controller, 
then 'gpio'.

I still don't understand where the unit address gets defined. 0 and 1 
look a bit made up. I'm sure you explained it before, but *this patch* 
needs to explain it. When you define a second protocol, the 0 and 1 
addresses are taken already, so you can't have 'clock-controller@0' for 
example.

Rob
