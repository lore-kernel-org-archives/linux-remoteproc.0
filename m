Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Dec 2017 22:11:02 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC 1/6] remoteproc: add early probed subdevices
Message-ID: <20171214061102.GR17344@builder>
References: <1511534202-12995-1-git-send-email-arnaud.pouliquen@st.com>
 <1511534202-12995-2-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1511534202-12995-2-git-send-email-arnaud.pouliquen@st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: linux-remoteproc@vger.kernel.org, Loic PALLARDY <loic.pallardy@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 24 Nov 06:36 PST 2017, Arnaud Pouliquen wrote:

> From: Fabien Dessenne <fabien.dessenne@st.com>
> 
> Add the option to use rproc subdevices that are probed *before* the
> remote processor firmware boot.
> 

Rather than adding a somewhat obscure variant of subdevices I think you
should take Loic's addition of a "release" callback on the memory node
and turn this into a struct rproc_resource that can be embedded in
various resource-types (using container_of to grab the specific struct).

Transitioning carveouts, mappings, vrings etc to using this should allow
us to turn all the different lists of resources that should be
acquired before boot and released after shutdown.


And rather than starting by introducing the SRM I would like to see an
example that hands over the control of "clk" in imx_rproc.c to the
remoteproc core (this is the simplest example I could find).

This can then be built upon to allow referencing additional clocks to
enable statically, by name, from the resource table.

> @@ -881,20 +881,27 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  		rproc->table_ptr = loaded_table;
>  	}
>  
> +	/* early probe any subdevices for the remote processor */
> +	ret = rproc_probe_subdevices(&rproc->early_subdevs);
> +	if (ret) {
> +		dev_err(dev, "failed to early probe subdevices for %s: %d\n",
> +			rproc->name, ret);
> +		return ret;

Enabling the "early" resources this late will make it infeasible to use
for things like clocking memories of the remoteproc.

> @@ -1028,6 +1041,9 @@ static int rproc_stop(struct rproc *rproc)
>  		return ret;
>  	}
>  
> +	/* remove any early-probed subdevices for the remote processor */
> +	rproc_remove_subdevices(&rproc->early_subdevs);
> +

This will cause "early subdevs" to be disabled during recovery, just to
be enabled immediately again.

So I think that like the memory resources we want to hold on to them
from boot to shutdown. Preferably in a way that allows us to provide the
ordering that allow us to use this mechanism to describe clocks for
memories in the remoteproc.

Regards,
Bjorn
