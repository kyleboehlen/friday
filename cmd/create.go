package cmd

import (
	"fmt"
	"friday/cmd/christmas-container"
	"github.com/spf13/cobra"
)

func init() {
	createCmd.AddCommand(createChristmasContainerCmd)
	rootCmd.AddCommand(createCmd)
}

var createCmd = &cobra.Command{
	Use:   "create",
	Short: "Create a specified resource",
	Long:  `Create a specified resource, such as a container, for another project.`,
	Run: func(cmd *cobra.Command, args []string) {
		//fmt.Println("Hugo Static Site Generator v0.9 -- HEAD")
		fmt.Println("create called")
	},
}

var createChristmasContainerCmd = &cobra.Command{
	Use:   "christmas-container",
	Short: "Create an AoC container",
	Long:  `Creates a container for working on AoC with my Python boilerplate.`,
	Run: func(cmd *cobra.Command, args []string) {
		christmas_container.CreateChristmasContainer()
	},
}
