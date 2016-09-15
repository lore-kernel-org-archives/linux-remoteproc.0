Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 15 Sep 2016 11:58:52 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 18/19] remoteproc: core: Add function to create
 remoteproc local resource table
Message-ID: <20160915185852.GG21438@tuxbot>
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
 <1472676622-32533-19-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1472676622-32533-19-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 31 Aug 13:50 PDT 2016, Loic Pallardy wrote:

> Rproc driver has now the capability to add resources dynamically
> thanks to rproc_request_resource API.
> Depending on associated action, resource request could impact
> firmware resource table or define new local resource.
> 
> In order to preserve current remoteproc resource handling
> mechanism, all local resources are gathered in a local resource
> table which won't be shared with firmware and proceed by
> remoteproc core as firmware one.
> 
> It is rproc driver responsibility to provide the right resource
> information using rproc_request_resource API.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 80 +++++++++++++++++++++++++++++++++++-
>  include/linux/remoteproc.h           |  1 +
>  2 files changed, 80 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index cbfbdf8..73b460a 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1270,6 +1270,65 @@ static int rproc_apply_resource_overrides(struct rproc *rproc,
>  	return ret;
>  }
>  
> +static struct resource_table*
> +rproc_local_resource_create(struct rproc *rproc, int *tablesz)

The resource table is a persistent data structure and as such it's
awkward and inconvenient to operate on. This does, unfortunately, show
throughout this series.

But to here traverse a list of resources, generate a new table of the
left-over ones just so that we can allocate them and put them back on
another list is a clear sign to me that we're doing it wrong way.

Further more, we will have to support 64 bit addresses in the firmware
so I do not want to lock in the core implementation in version 1 of the
resource table format.



Rather than using the resource tables directly I think we should parse
the resource table into lists of objects that are convenient to operate
on. While doing this we can squash "duplicates" and validate that they
are compatible.

This allows the driver to (optionally) register static resources
and the resource table parser to (optionally!) register firmware
resources. We would then traverse these lists and if resources are
referenced update the resource table entries - i.e. like vrings are
handled already.


We can do this two ways:
1) As we register entries in these lists we check for previous
allocations and fall back to allocate the resources directly. Allowing
the drivers to fill in the lists and override resources from the table
parser. A drawback with this approach is that driver-registered
resources must stay allocated throughout the driver's life cycle.

2) We defer allocations to after we've built up the resource lists,
allowing the static/driver resources to be allocated as we boot the
rproc. Grouping the allocations would, likely, make it easier to reason
about error paths etc.

Regards,
Bjorn
