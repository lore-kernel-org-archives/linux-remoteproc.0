Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Dec 2017 22:24:22 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC 5/6] remoteproc: Add posibility to probe a sub device.
Message-ID: <20171214062422.GT17344@builder>
References: <1511534202-12995-1-git-send-email-arnaud.pouliquen@st.com>
 <1511534202-12995-6-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1511534202-12995-6-git-send-email-arnaud.pouliquen@st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: linux-remoteproc@vger.kernel.org, Loic PALLARDY <loic.pallardy@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 24 Nov 06:36 PST 2017, Arnaud Pouliquen wrote:

> @@ -1343,6 +1344,11 @@ int rproc_add(struct rproc *rproc)
>  			return ret;
>  	}
>  
> +	/* add resource manager device */
> +	ret = devm_of_platform_populate(dev->parent);
> +	if (ret < 0)
> +		return ret;

With the Qualcomm remoteprocs we describe the communication links as
sub-nodes of the remoteproc node to allow binding drivers to channels by
compatible, provide properties to the devices and expose remote services
in DT (e.g. for the purpose of implementing regulators, clocks and other
resources for the system).

I'm surprised this has not been brought up yet for rpmsg, but I assume
it will come at some point, e.g. that we would have something like:

remoteproc {
	compatible = "acme,rproc";

	vdev0 {
		reg = <0>;

		acme_clocks: clock-controller {
			compatible = "acme,clock-controller";
			#clock-cells = <1>;
		};
	};
};


So blindly creating platform_devices for any subnodes of the remoteproc
node doesn't work for the Qualcomm drivers and won't work if we ever
want to describe something else than a platform driver as a child of any
other remoteproc.

Regards,
Bjorn
